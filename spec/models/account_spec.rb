require "rails_helper"

RSpec.describe Account, type: :module do
  let(:email) { "yes@email.com" }
    subject { FactoryBot.create(:account, email:) }

  it "is valid with valid attributes" do
    expect(subject.email).to eq("yes@email.com")
  end
end
