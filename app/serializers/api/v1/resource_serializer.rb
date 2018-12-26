# frozen_string_literal: true

class Api::V1::ResourceSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :description,
    :phone,
    :address,
    :status,
    :shares,
    :food,
    :health,
    :shelter,
    :latitude,
    :longitude
  )
  attribute :bearing, if: -> { object.respond_to?(:bearing) }
  attribute :distance, if: -> { object.respond_to?(:distance) }
end
