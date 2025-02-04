# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Login", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "when visiting the index" do
    it "should find the title" do
      visit "/"
      expect(page).to have_text('Studense')
    end
  end
end
