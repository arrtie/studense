# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminPolicy, type: :policy do
  subject { Pundit.policy(user, Admin) }

  context "where the user is not an admin" do
    let(:user) { create(:account) }

    describe "#index" do
      it "should return false" do
        expect(subject.index?).to be(false)
      end
    end

    describe "#new" do
      it "should return false" do
        expect(subject.new?).to be(false)
      end
    end

    describe "#show" do
      it "should return false" do
        expect(subject.show?).to be(false)
      end
    end

    describe "#create" do
      it "should return false" do
        expect(subject.create?).to be(false)
      end
    end
  end

  context "where the user is an admin" do
    let(:user) { create(:account, :as_admin) }

    describe "#index" do
      it "should return true" do
        expect(subject.index?).to be(true)
      end
    end

    describe "#new" do
      it "should return true" do
        expect(subject.new?).to be(true)
      end
    end

    describe "#show" do
      it "should return true" do
        expect(subject.show?).to be(true)
      end
    end

    describe "#create" do
      it "should return true" do
        expect(subject.create?).to be(true)
      end
    end
  end
end
