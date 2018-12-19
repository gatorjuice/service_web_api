class Resource < ApplicationRecord
  enum status: [:unverified, :verified]

  geocoded_by :address

  after_validation :geocode

  def address
    [street, city, state, zipcode].join(', ')
  end
end
