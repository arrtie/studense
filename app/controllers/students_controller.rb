# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student_and_profile, only: %i[show destroy]

  def index
    @students = Student.includes(:profile).all
  end

  def show
    @enrollments = Enrollment.where(student_id: params[:id])
  end

  def new
    profile = Current.account.profile
    @student = Student.new({ profile_id: profile.id })
  end

  def create
    @student = self.new
    if @student.save!
      redirect_to @student
    else
      redirect_to new_student_url(), status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def set_student_and_profile
    @student =  Student.includes(:profile).find(params[:id])
    @profile = @student.profile
  end
end
