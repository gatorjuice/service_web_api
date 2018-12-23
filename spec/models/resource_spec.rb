require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe '.food' do
    let(:food_resource) { create(:resource, :food) }

    before do
      create(:resource, :health)
      create(:resource, :shelter)
    end

    it 'returns resources with food' do
      expect(Resource.food).to match_array([food_resource])
    end
  end

  describe '.health' do
    let(:health_resource) { create(:resource, :health) }

    before do
      create(:resource, :food)
      create(:resource, :shelter)
    end

    it 'returns resources with health' do
      expect(Resource.health).to match_array([health_resource])
    end
  end

  describe '.shelter' do
    let(:shelter_resource) { create(:resource, :shelter) }

    before do
      create(:resource, :food)
      create(:resource, :health)
    end

    it 'returns resources with shelter' do
      expect(Resource.shelter).to match_array([shelter_resource])
    end
  end
end
