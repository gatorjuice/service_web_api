# frozen_string_literal: true

class Resource < ApplicationRecord
  enum status: %i[unverified verified]

  validates_presence_of :name, :description, :street, :city, :state, :zipcode
  validate :resource_type?

  after_validation :geocode

  geocoded_by :address

  scope :food, -> { where(food: true) }
  scope :health, -> { where(health: true) }
  scope :shelter, -> { where(shelter: true) }

  scope :close, lambda { |latitude, longitude, mi_radius|
    near([latitude, longitude], mi_radius)
  }

  scope :closest, lambda { |latitude, longitude|
    min_by { |resource| resource.distance_from([latitude, longitude]) }
  }

  def share_sms(to)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    return unless client.messages.create(body: sms_body, from: ENV['TWILIO_FROM'], to: to)

    increment!(:shares)
  end

  private

  def address
    [street, city, state, zipcode].join(', ')
  end

  def resource_type?
    return if food || health || shelter

    errors.add(:base, '1+ resource type must be set (food, health, shelter)')
  end

  def sms_body
    "#{name} - #{phone} - #{address}"
  end
end
