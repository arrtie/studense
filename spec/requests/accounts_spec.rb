# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Accounts API", type: :request do
  describe "POST /accounts" do
    let(:account_params) { attributes_for(:account, profile_attributes: attributes_for(:profile)) } # Generates valid params
    let(:post_account) {
      post "/accounts", params: { account: account_params }
    }

    it "creates an account with a profile" do
      expect { post_account }.to change { Account.count }.by(1)
    end
  end
end
