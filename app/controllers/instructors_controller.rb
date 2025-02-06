# frozen_string_literal: true

class InstructorsController < ApplicationController
  before_action :set_profile

  def index
    @instructors = Instructor.all
  end
  def show
    @instructor = Instructor.find(params[:id])
    @courses = Course.where(instructor_id: params[:id])
  end
  def new
    @instructor = Instructor.new({ profile_id: @profile.id })
  end

  def destroy
    if Instructor.find(params[:id]).destroy
      redirect_to instructors_path, notice: "Instructor profile deleted"
    end
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
    @profile = current_user.profile
  end
end
