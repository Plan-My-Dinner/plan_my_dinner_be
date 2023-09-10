FactoryBot.define do
  factory :saved_recipe do
    user
    api_recipe_id { Faker::Number.number(digits: 1) }
    favorited { [true, false].sample }
  end
end
