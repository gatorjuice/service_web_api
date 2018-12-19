class Api::V1::ResourcesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :define_location, only: [:index]
  before_action :define_resource, only: [:show, :update, :destroy]

  attr_reader :resource, :latitude, :longitude, :radius

  def index
    resources = Resource.close(latitude, longitude, radius)

    if params[:closest]
      resources = [
        resources.food.closest(latitude, longitude),
        resources.health.closest(latitude, longitude),
        resources.shelter.closest(latitude, longitude)
      ]
    end

    render json: resources
  end

  def show
    render json: resource
  end

  def create
    resource = Resource.new(resource_params)

    if resource.save
      render status: :success, json: resource
    else
      render status: :error, json: { message: 'resource failed to save.' }
    end
  end

  def update
    if resource.update(resource_params)
      render status: :success, json: resource
    else
      render status: :error, json: { message: 'resource failed to update.' }
    end
  end

  def destroy
    resource.delete
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
