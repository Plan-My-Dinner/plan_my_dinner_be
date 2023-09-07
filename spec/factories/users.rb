FactoryBot.define do
  factory :user do
    # Keyword arguments: min_length, max_length, mix_case, special_characters
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
