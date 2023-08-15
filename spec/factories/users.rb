FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    # Keyword arguments: min_length, max_length, mix_case, special_characters
    password { Faker::Internet.password }
  end
end
