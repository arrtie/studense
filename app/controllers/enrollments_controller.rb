# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  before_action :set_student
  before_action :prevent_duplicate_enrollment, only: :create
  before_action :prevent_full_course_enrollment, only: :create

  def index
    @enrollment_table = Enrollment.includes(:course, :student).all.map do |enrollment|
      { id: enrollment.id, course_name: enrollment.course.name, student_name: enrollment.student.profile.first_name }
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save!
      redirect_to @enrollment
    else
      redirect_to :new, alert: "uhoh, something went wrong 😬"
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id).merge(student_id: @student.id)
  end

  def prevent_duplicate_enrollment
    if Enrollment.exists?(student_id: @student.id, course_id: params[:enrollment][:course_id])
      redirect_to new_enrollment_path, alert: "you're already enrolled in this course, silly 😂"
    end
  end

  def prevent_full_course_enrollment
    course = Course.find(params[:enrollment][:course_id])
    if course.enrollments.count >= course.student_limit
      redirect_to new_enrollment_path, alert: "Sorry, this course is full 🥺"
    end
  end

  def set_student
    @student = Current.account.profile.student
  end
end
