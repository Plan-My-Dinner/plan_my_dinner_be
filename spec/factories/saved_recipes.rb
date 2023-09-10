FactoryBot.define do
  factory :saved_recipe do
    user
    api_recipe_id { Faker::Number.within(range: 1..100) }
    favorited { [true, false].sample }
  end
end
