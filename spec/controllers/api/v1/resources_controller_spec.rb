require 'rails_helper'

RSpec.describe Api::V1::ResourcesController, type: :controller do
  describe 'GET#index' do
    context 'closest param is true' do
      let!(:food_resource) { create :resource, :food }
      let!(:health_resource) { create :resource, :health }
      let!(:shelter_resource) { create :resource, :shelter }

      it 'returns the closest of each resource' do
        get :index, params: {
          latitude: 41.878113,
          longitude: -87.629799,
          radius: 10000000,
          closest: true
         }

        expect(response.body).to eq []
      end
    end

    context 'closest param is nil or false' do
      it 'returns all resources within the radius' do
      end
    end
  end
end


  # def index
  #   resources = Resource.close(latitude, longitude, radius)

  #   if params[:closest]
  #     resources = [
  #       resources.food.closest(latitude, longitude),
  #       resources.health.closest(latitude, longitude),
  #       resources.shelter.closest(latitude, longitude)
  #     ]
  #   end

  #   render json: resources
  # end
