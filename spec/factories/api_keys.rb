FactoryBot.define do
  factory :api_key do
    key { 'RandomKey' }
    active { true }

    factory :inactive_api_key do
      active { false }
    end
  end
end
