class Resource < ApplicationRecord
  enum status: [:unverified, :verified]

  after_validation :geocode

  geocoded_by :address

  def address
    [street, city, state, zipcode].join(', ')
  end
end
