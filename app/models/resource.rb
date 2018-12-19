class Resource < ApplicationRecord
  enum status: [:unverified, :verified]

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
end
