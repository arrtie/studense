# frozen_string_literal: true

class LandingsController < ApplicationController
  allow_unauthenticated_access only: [ :show ]
  before_action :resume_session, only: [ :show ]

  def show
    if authenticated?
      get_profiles
      render variants: [ :authenticated ]
    end
  end
end
