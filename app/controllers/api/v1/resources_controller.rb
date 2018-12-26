# frozen_string_literal: true

class Api::V1::ResourcesController < ApplicationController
  before_action :define_location, only: [:index]
  before_action :define_resource, only: %i[show update destroy]

  attr_reader :resource, :latitude, :longitude, :radius

  api :GET, '/v1/resources'
  param :latitude, String, desc: 'latitude of your location', required: true
  param :longitude, String, desc: 'longitude of your location', required: true
  param :radius, String, desc: 'radius, in miles, whithin to show results', required: true
  param :closest, String, desc: 'return only the closest of each resource type'
  def index
    resources = Resource.close(latitude, longitude, radius)

    if params[:closest]
      resources = [
        resources.food.closest(latitude, longitude),
        resources.health.closest(latitude, longitude),
        resources.shelter.closest(latitude, longitude)
      ]
    end

    render_success(resources.select(&:present?))
  rescue StandardError => error
    render_error(error.inspect)
  end

  api :GET, '/v1/resources/:id'
  param :id, String, desc: 'id of the requested resource', required: true
  def show
    render_success(resource)
  rescue StandardError => error
    render_error(error.inspect)
  end

  api :POST, '/v1/resources'
  def create
    resource = Resource.create!(resource_params)
    render_success(resource)
  rescue StandardError => error
    render_error(error.inspect)
  end

  def update
    resource.update!(resource_params)
    render_success(resource)
  rescue StandardError => error
    render_error(error.inspect)
  end

  def destroy
    resource.destroy!
    render_success(resource)
  rescue StandardError => error
    render_error(error.inspect)
  end

  private

  def define_location
    @latitude ||= params.require(:latitude)
    @longitude ||= params.require(:longitude)
    @radius ||= params.require(:radius)
  end

  def define_resource
    @resource ||= Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(
      :name,
      :street,
      :city,
      :state,
      :zipcode,
      :latitude,
      :longitude,
      :phone,
      :description,
      :food,
      :health,
      :shelter
    )
  end
end
