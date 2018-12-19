class Api::V1::ResourcesController < ApplicationController
  def index
    render json: Resource.all
  end

  def show
    render json: Resource.find(params[:id])
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

  end

  def destroy

  end

  private

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
