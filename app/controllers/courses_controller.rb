class CoursesController < ApplicationController
  before_action :set_profile

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @instructor = Instructor.find_by({ profile_id: @profile.id })

    if @instructor.nil?
      redirect_to courses_url(), status: :unprocessable_entity
      return
    end

    @course = Course.new({ instructor_id: @instructor.id })
  end

  def create
    @course = self.new
    if @course.save!
      redirect_to @course
    else
      redirect_to new_course_url(), status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = helpers.current_account.profile
  end
end
