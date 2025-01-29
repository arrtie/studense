# frozen_string_literal: true

class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end
end
