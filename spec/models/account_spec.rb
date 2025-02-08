# frozen_string_literal: true

require "rails_helper"

RSpec.describe Account, type: :module do
  describe "#save" do
    context "when account attributes are missing" do
      it "does not save" do
        expect(subject.save).to be(false), "Account needs a profile to save"
      end
    end

    context "when account attributes are present" do
      subject { Account.new(email: "f@e.com", password: "password",  password_confirmation: "password") }

      context "and a profile is not present" do
        it "does not save" do
          expect(subject.save).to be(false), "Account needs a profile to save"
        end
      end

      context "and a profile is present" do
        it "saves successfully" do
          subject.build_profile(first_name: "firsty", last_name: "lasty", birthdate: 18.years.ago)
          expect(subject.save).to be(true)
        end

        it "creates an account and profile" do
          profile_count = Profile.count
          account_count = Account.count
          subject.build_profile(first_name: "firsty", last_name: "lasty", birthdate: 18.years.ago).save
          expect(Profile.count).to eq(profile_count + 1)
          expect(Account.count).to eq(account_count + 1)
        end
      end
    end
  end

  describe "#destroy" do
    let(:account) { FactoryBot.create(:account) }
    subject { account.destroy }

    it "destroys the account and profile" do
      account
      profile_count = Profile.count
      account_count = Account.count
      subject
      expect(Profile.count).to eq(profile_count - 1)
      expect(Account.count).to eq(account_count - 1)
    end
  end
end
