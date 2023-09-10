FactoryBot.define do
  factory :saved_recipies do
    user_id { 1 }
    api_recipie_id { Faker::Number.number(digits: 1) }
    favorited { false }
  end
end
