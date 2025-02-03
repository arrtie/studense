# frozen_string_literal: true

class LandingsController < ApplicationController
  allow_unauthenticated_access only: :show

  def show
    if authenticated?
      get_profiles
      puts "profile: " + @profile.first_name
      render variants: [ :authenticated ]
    end
  end
end
