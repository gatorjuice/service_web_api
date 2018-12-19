class Resource < ApplicationRecord
  RADIUS = 10 # miles

  enum status: [:unverified, :verified]

  after_validation :geocode

  geocoded_by :address

  scope :food, -> () { where(food: true) }
  scope :health, -> () { where(health: true) }
  scope :shelter, -> () { where(shelter: true) }

  scope :close, -> (lat, long) { near([lat, long], RADIUS) }
  scope :closest, -> (lat, long) do
    min_by { |resource| resource.distance_from([lat, long]) }
  end

  private

  def address
    [street, city, state, zipcode].join(', ')
  end
end
