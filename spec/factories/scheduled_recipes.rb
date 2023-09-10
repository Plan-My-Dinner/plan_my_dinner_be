FactoryBot.define do
  factory :scheduled_recipe do
    saved_recipe
    scheduled_date { Faker::Date.forward(days: 30) }
  end
end
