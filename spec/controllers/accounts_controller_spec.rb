# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccountsController, type: :controller do
  describe "#create" do
    let(:create_account) {
      post :create, params: { account: account_params }
    }

    context "without attributes for profile" do
      let(:account_params) { attributes_for :account }

      it "should not create an account" do
        expect {
          create_account
        }.to change { Account.count }.by(0)
        expect(response).to render_template "accounts/new"
      end
    end

    context "with attributes for profile" do
      let(:account_params) { attributes_for :account, profile_attributes: attributes_for(:profile) }

      it "should create an account" do
        expect {
          create_account
        }.to change { Account.count }.by(1)
        expect(response).to redirect_to "/accounts/#{Account.find_by(email: account_params[:email]).id}"
      end
    end
  end
end
