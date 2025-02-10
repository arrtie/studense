# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Enrollments API", type: :request do
  let(:course) { FactoryBot.create(:course) }
  let(:user) { FactoryBot.create(:account) }

  describe "POST /enrollments" do
    context "when the user is authenticated" do
      before :example do
        test_login user
      end

      context "when the user has a student profile" do
        let(:profile) { FactoryBot.build(:profile, :with_student) }
        let(:user) { FactoryBot.create(:account, profile:) }

        it "creates an enrollment and redirects to it" do
          enrollment_count = Enrollment.count
          post enrollments_url, params: { enrollment: FactoryBot.attributes_for(:enrollment, student_id: user.profile.student.id, course_id: course.id) }
          the_enrollment = Enrollment.where(student_id: user.profile.student.id, course_id: course.id)[0]
          expect(Enrollment.count).to be(enrollment_count + 1)
          expect(response).to redirect_to enrollment_path(the_enrollment)
        end
      end
    end
  end
end
