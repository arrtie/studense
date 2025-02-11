# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/admin_requests", type: :request do
  context "when authenticated" do
    let(:user) { FactoryBot.create(:account) }

    before(:example) do
      test_login user
    end

    context "when an admin" do
      let(:user) { FactoryBot.create(:account, :with_admin) }

      describe "GET /index" do
        context "when approvable is a course" do
          it "renders a successful response" do
            FactoryBot.create(:admin_request, :with_course)
            get admin_requests_url
            expect(response).to have_http_status(200)
          end
        end

        context "when approvable is an enrollment" do
          it "renders a successful response" do
            FactoryBot.create(:admin_request, :with_enrollment)
            get admin_requests_url
            expect(response).to have_http_status(200)
          end
        end
      end

      describe "GET /show" do
        context "when approvable is a course" do
          it "renders a successful response" do
            admin_request = FactoryBot.create(:admin_request, :with_course)
            get admin_request_url(admin_request)
            expect(response).to be_successful
          end
        end

        context "when approvable is an enrollment" do
          it "renders a successful response" do
            admin_request = FactoryBot.create(:admin_request, :with_enrollment)
            get admin_request_url(admin_request)
            expect(response).to be_successful
          end
        end
      end
    end

    context "when not an admin" do
      describe "GET /index" do
        context "when approvable is a course" do
          it "redirects to login" do
            FactoryBot.create(:admin_request, :with_course)
            get admin_requests_url
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(root_path)
          end
        end

        context "when approvable is an enrollment" do
          it "redirects to login" do
            FactoryBot.create(:admin_request, :with_enrollment)
            get admin_requests_url
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(root_path)
          end
        end
      end

      describe "GET /show" do
        context "when approvable is a course" do
          it "redirects to login" do
            admin_request = FactoryBot.create(:admin_request, :with_course)
            get admin_request_url(admin_request)
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(root_path)
          end
        end

        context "when approvable is a enrollment" do
          it "redirects to login" do
            admin_request = FactoryBot.create(:admin_request, :with_enrollment)
            get admin_request_url(admin_request)
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(root_path)
          end
        end
      end
    end
  end

  context "when not authenticated" do
    describe "GET /index" do
      context "when approvable is a course" do
        it "redirects to login" do
          FactoryBot.create(:admin_request, :with_course)
          get admin_requests_url
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_session_path)
        end
      end

      context "when approvable is an enrollment" do
        it "redirects to login" do
          FactoryBot.create(:admin_request, :with_enrollment)
          get admin_requests_url
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_session_path)
        end
      end
    end

    describe "GET /show" do
      context "when approvable is a course" do
        it "redirects to login" do
          admin_request = FactoryBot.create(:admin_request, :with_course)
          get admin_request_url(admin_request)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_session_path)
        end
      end

      context "when approvable is a enrollment" do
        it "redirects to login" do
          admin_request = FactoryBot.create(:admin_request, :with_enrollment)
          get admin_request_url(admin_request)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_session_path)
        end
      end
    end
  end
end
