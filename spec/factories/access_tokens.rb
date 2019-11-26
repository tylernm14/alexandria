FactoryBot.define do
  factory :access_token do
    token_digest { nil }
    accessed_at { "2019-11-25 21:13:22" }
    user
    api_key
  end
end