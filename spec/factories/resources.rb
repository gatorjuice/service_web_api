FactoryBot.define do
  factory :resource do
    name { 'test resource' }
    description  { 'it is a test resource' }
    street { '2400 N Western Ave' }
    city { 'Chicago' }
    state { 'IL' }
    zipcode { '60625' }

    trait :food do
      food true
    end

    trait :health do
      health true
    end

    trait :shelter do
      shelter true
    end
  end
end
