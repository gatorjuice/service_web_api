# frozen_string_literal: true

FactoryBot.define do
  factory :resource do
    name { 'test resource' }
    description  { 'it is a test resource' }
    street { '2400 N Western Ave' }
    city { 'Chicago' }
    state { 'IL' }
    zipcode { '60625' }
    latitude { 41.90154 }
    longitude { -87.694389 }

    trait :food do
      food true
    end

    trait :health do
      health true
    end

    trait :shelter do
      shelter true
    end

    trait :far_away do
      food true
      health true
      shelter true
      latitude 90.90154
      longitude -1.694389
    end
  end
end
