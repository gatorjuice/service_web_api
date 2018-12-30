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

  private

  def address
    [street, city, state, zipcode].join(', ')
  end

  def resource_type?
    return if food || health || shelter

    errors.add(:base, '1+ resource type must be set (food, health, shelter)')
  end
end
