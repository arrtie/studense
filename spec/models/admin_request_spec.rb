require 'rails_helper'

RSpec.describe AdminRequest, type: :model do
  describe "#save" do
    context "when there is no approvable" do
      let(:approvable) { nil }

      it "does not create an AdminRequest" do
        adminRequest = AdminRequest.new(approvable:)
        expect { adminRequest.save }.to change(AdminRequest, :count).by(0)
      end
    end

    context "when the approvable is a Course" do
      let(:approvable) { FactoryBot.create(:course) }

      it "creates an AdminRequest with a pending status" do
        adminRequest = AdminRequest.new(approvable:)
        expect { adminRequest.save }.to change(AdminRequest, :count).by(1)
        expect(adminRequest.pending?).to be(true)
      end
    end

    context "when the approvable is an Enrollment" do
      let(:approvable) { FactoryBot.create(:enrollment) }

      it "creates an AdminRequest with a pending status" do
        adminRequest = AdminRequest.new(approvable:)
        expect { adminRequest.save }.to change(AdminRequest, :count).by(1)
        expect(adminRequest.pending?).to be(true)
      end
    end
  end
end
