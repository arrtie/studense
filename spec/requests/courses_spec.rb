# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Courses API", type: :request do
  describe "POST /courses" do
    let(:current_account) { FactoryBot.create(:account) }

    context "when authenticated" do
      before(:example) do
        test_login current_account
      end

      context "when the user is an instructor" do
        let(:current_account) { FactoryBot.create(:account, :as_instructor) }
        let(:course_params) { return { course: attributes_for(:course, instructor: current_account.profile.instructor) } }

        it "should create a course" do
          expect { post courses_url, params: course_params }.to change(Course, :count).by(1)
        end
      end
      context "when the user is not an instructor" do
        let(:course_params) { return { course: attributes_for(:course) } }

        it "should not create a course" do
          expect { post courses_url, params: course_params }.to change(Course, :count).by(0)
        end

        it "should raise an error" do
          post courses_url, params: course_params
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
