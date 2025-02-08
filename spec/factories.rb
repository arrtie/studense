FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    password { "blah" }
    password_confirmation { password }

    trait :as_admin do
      association :admin
    end

    after(:build) do |account|
      account.profile ||= create(:profile, account: account)
    end
  end

  factory :admin do
    association :account
  end

  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.between(from: 18.years.ago, to: 118.years.ago) }
  end
end
