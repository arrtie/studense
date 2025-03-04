# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/admins", type: :request do
  context "when authenticated" do
    let(:current_account) { FactoryBot.create(:account) }
    let(:admin) { FactoryBot.create(:admin) }

    before(:example) do
      test_login(current_account)
    end

    context "when the user is an admin" do
      let(:current_account) { FactoryBot.create(:account, :with_admin) }

      describe "GET /index" do
        it "renders a successful response" do
          get admins_url
          expect(response).to be_successful
        end
      end

      describe "GET /show" do
        it "renders a successful response" do
          get admin_url(admin)
          expect(response).to be_successful
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_admin_url
          expect(response).to be_successful
        end
      end

      describe "GET /edit" do
        it "routes to #edit" do
          get "/admins/1/edit"
          expect(response).to have_http_status(404)
        end
      end

      describe "POST /create" do
        let(:params) { { admin: { account_id: current_account.id } } }

        context "with valid parameters" do
          it "creates a new Admin" do
            expect {
              post admins_url, params:
            }.to change(Admin, :count).by(1)
          end

          it "redirects to the created admin" do
            post admins_url, params: params
            expect(response).to redirect_to(admin_url(Admin.last))
          end
        end

        context "with invalid parameters" do
          let(:params) { { admin: { account_id: "lol" } } }

          it "does not create a new Admin" do
            expect {
              post admins_url, params:
            }.to change(Admin, :count).by(0)
          end

          it "renders a response with 422 status (i.e. to display the 'new' template)" do
            post admins_url, params: params
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end

      describe "PATCH /update" do
        let(:account) { FactoryBot.create(:account)            }
        let(:params)  { { admin:  { account_id: account.id } } }

        it "renders a response with 404" do
          patch admin_url(admin), params: params
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "DELETE /destroy" do
        let(:admin) {
          FactoryBot.create(
            :admin,
            account:
            FactoryBot.create(:account)
            )
        }

        it "destroys the requested admin" do
          admin
          expect {
            delete admin_url(admin)
          }.to change(Admin, :count).by(-1)
        end

        it "redirects to the admins list" do
          admin
          delete admin_url(admin)
          expect(response).to redirect_to(admins_url)
        end
      end
    end

    context "when the user is not an admin" do
      describe "GET /index" do
        it "redirects to login" do
          get admins_url
          expect(response).to have_http_status(302)
        end
      end

      describe "GET /show" do
        it "redirects to login" do
          get admin_url(admin)
          expect(response).to have_http_status(302)
        end
      end

      describe "GET /new" do
        it "redirects to login" do
          get new_admin_url
          expect(response).to have_http_status(302)
        end
      end

      describe "GET /edit" do
        it "routes to #edit" do
          get "/admins/1/edit"
          expect(response).to have_http_status(404)
        end
      end

      describe "POST /create" do
        let(:params) { { admin: { account_id: current_account.id } } }

        context "with valid parameters" do
          it "does not create a new Admin" do
            expect {
              post admins_url, params:
            }.to change(Admin, :count).by(0)
          end
        end
      end

      describe "PATCH /update" do
        let(:account) { FactoryBot.create(:account)            }
        let(:params)  { { admin:  { account_id: account.id } } }

        it "renders a response with 404" do
          patch admin_url(admin), params: params
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "DELETE /destroy" do
        let(:admin) {
          FactoryBot.create(
            :admin,
            account:
              FactoryBot.create(:account)
          )
        }

        it "does not destroy the requested admin" do
          admin
          expect {
            delete admin_url(admin)
          }.to change(Admin, :count).by(0)
        end
      end
    end
  end


  context "when not authenticated" do
    describe "GET /index" do
      it "redirects to the login path" do
        get admins_url
        assert_redirected_to new_session_path
      end
    end
  end
end
