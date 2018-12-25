class Resource < ApplicationRecord
  enum status: [:unverified, :verified]

  validates_presence_of :name, :description, :street, :city, :state, :zipcode
  validate :has_resource_type

  after_validation :geocode

  geocoded_by :address

  scope :food, -> () { where(food: true) }
  scope :health, -> () { where(health: true) }
  scope :shelter, -> () { where(shelter: true) }

  scope :close, -> (latitude, longitude, mi_radius) do
    near([latitude, longitude], mi_radius)
  end

  scope :closest, -> (latitude, longitude) do
    min_by { |resource| resource.distance_from([latitude, longitude]) }
  end

  private

  def address
    [street, city, state, zipcode].join(', ')
  end

  def has_resource_type
    unless food || health || shelter
      errors.add(:base, 'at least one resource type must be set (food, health, shelter)')
    end
  end
end
