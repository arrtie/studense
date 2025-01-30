# frozen_string_literal: true

class InstructorsController < ApplicationController
  before_action :set_profile

  def index
    @instructors = Instructor.all
  end
  def show
    @instructor = Instructor.find(params[:id])
  end
  def new
    @instructor = Instructor.new({ profile_id: @profile.id })
  end

  def create
    @instructor = self.new
    if @instructor.save!
      redirect_to @instructor
    else
      redirect_to new_instructor_url(), status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = helpers.current_account.profile
  end
end
