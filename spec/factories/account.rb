FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    password { "blah" }
    password_confirmation { "blah" }

    after(:build) do |account, evaluator|
      account.profile ||= build(:profile, account: account)
    end
  end
end
