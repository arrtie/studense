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
    @instructor = Instructor.find_by({ profile_id: @profile.id })
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  private

  def set_profile
    @profile = helpers.current_account.profile
  end

  def course_params
    params.require(:course).permit(:name, :start_date, :end_date, :student_limit, :instructor_id)
  end
end
