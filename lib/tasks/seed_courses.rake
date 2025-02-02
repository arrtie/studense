# frozen_string_literal: true

desc "give all instructors a course"
namespace :seed do
  task courses: [ :environment ] do
    Instructor.find_each do |instructor|
      instructor.courses.create(
        name: Faker::Educator.course_name,
        student_limit: Faker::Number.within(range: 5..45),
        start_date: Faker::Date.forward(days: 30),
        end_date: Faker::Date.forward(days: 90))
    end
  end
end
