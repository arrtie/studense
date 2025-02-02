# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def make_account(domain:)
  password = Faker::Internet.password
  Account.new(email: Faker::Internet.email(domain:), password:, password_confirmation: password)
end

def build_profile(current_acc:)
  current_acc.build_profile(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: Faker::Date.between(from: 100.years.ago, to: 18.years.ago))
end

def create_instructor_profile_and_account
  build_profile(make_account(domain: "instructor.biz"))
    .build_instructor()
    .save!
end

# make Instructor accounts
5.times do |count|
  create_instructor_profile_and_account
end

def create_student_profile_and_account
  build_profile(make_account(domain: "student.biz"))
    .build_student()
    .save!
end

# make Student accounts
20.times do |count|
  create_student_profile_and_account
end
