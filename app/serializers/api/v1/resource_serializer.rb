class Api::V1::ResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :status, :shares, :food,
    :health, :shelter, :latitude, :longitude, :bearing, :distance
end
