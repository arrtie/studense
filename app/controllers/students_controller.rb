# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_profile

  def index
    @students = Student.all
  end
  def show
    @student = Student.find(params[:id])
  end
  def new
    @student = Student.new({ profile_id: @profile.id })
  end

  def create
    @student = self.new
    if @student.save!
      redirect_to @student
    else
      redirect_to new_student_url(), status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = helpers.current_account.profile
  end
end
