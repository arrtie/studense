require 'rails_helper'

RSpec.describe CoursePolicy, type: :policy do
  let(:user) { FactoryBot.create(:account) }

  describe "#new" do
    context "when the user has no instructor profile" do
      it "should be false" do
        expect(Pundit.policy(user, Course).new?).to be(false)
      end
    end

    context "when the user has an instructor profile" do
      it "should be true" do
        user.profile.build_instructor.save
        expect(Pundit.policy(user, Course).new?).to be(true)
      end
    end
  end
end
