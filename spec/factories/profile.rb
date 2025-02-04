FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.between(from: 18.years.ago, to: 118.years.ago) }

    association :account
  end
end
