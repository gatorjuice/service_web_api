require 'rails_helper'

RSpec.describe Api::V1::ResourcesController, type: :controller do
  describe 'GET#index' do
    let!(:food_resource) { create :resource, :food }
    let!(:health_resource) { create :resource, :health }
    let!(:shelter_resource) { create :resource, :shelter }
    let!(:distant_resource) { create :resource, :far_away }

    context 'closest param is true' do
      it 'returns the closest of each resource' do
        get :index, params: {
          latitude: 41.878113,
          longitude: -87.629799,
          radius: 100,
          closest: true
        }

        parsed_response = JSON.parse response.body

        expect(parsed_response.map { |resource| resource['id'] }).to match_array(
          [food_resource.id, health_resource.id, shelter_resource.id]
        )
      end
    end

    context 'closest param is nil or false' do
      it 'returns all resources within the radius' do
        get :index, format: :json, params: {
          latitude: 41.878113,
          longitude: -87.629799,
          radius: 100
        }

        parsed_response = JSON.parse response.body

        resource_ids = parsed_response.map { |resource| resource['id'] }

        expect(resource_ids).to match_array(
          [food_resource.id, health_resource.id, shelter_resource.id]
        )

        expect(resource_ids).to_not include distant_resource.id
      end
    end
  end
end
