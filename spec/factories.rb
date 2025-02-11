FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    password { "blah" }
    password_confirmation { password }

    trait :with_admin do
      association :admin
    end


    after(:build) do |account|
      account.profile ||= create(:profile, account: account)
    end

    trait :as_instructor do
      after(:build) do |account|
        account.profile ||= create(:profile, account: account)
        account.profile.instructor ||= create(:instructor, profile: account.profile)
      end
    end

    trait :with_student do
      after(:build) do |account|
        account.profile = create(:profile, :with_student, account: account)
      end
    end
  end

  factory :admin do
    association :account
  end

  factory :admin_request do
    status { :pending }

    trait :with_course do
      association :approvable, factory: :course
    end

    trait :with_enrollment do
      association :approvable, factory: :enrollment
    end
  end

  factory :course do
    name { Faker::Educator.course_name }
    start_date { 1.months.from_now }
    end_date { 4.months.from_now }
    student_limit { Faker::Number.between(from: 5, to: 160) }
    association :instructor
  end

  factory :enrollment do
    grade { 69 }
    association :student
    association :course
  end

  factory :instructor do
    association :profile
  end

  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.between(from: 18.years.ago, to: 118.years.ago) }
    association :account

    trait :with_instructor do
      after(:build) do |profile|
        FactoryBot.create(:instructor, profile:)
      end
    end

    trait :with_student do
      after(:build) do |profile|
        FactoryBot.create(:student, profile:)
      end
    end
  end

  factory :student do
    association :profile
  end
end
