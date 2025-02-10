class CoursesController < ApplicationController
  before_action :set_profile

  def index
    @courses = Course.all
  end

  def show
    @course = Course.joins(:admin_request, instructor: [ :profile ])
      .select(:name, :status, :instructor_id, :id, :first_name, :last_name, :start_date, :start_date, :student_limit).find(params[:id])
  end

  def new
    @instructor = Instructor.find_by({ profile_id: @profile.id })

    if !authorize Course
      redirect_to courses_url(), status: :unprocessable_entity
      return
    end

    @course = Course.new({ instructor_id: @instructor.id })
  end

  def create
    authorize Course
    @instructor = Instructor.find_by({ profile_id: @profile.id })
    @course = Course.new(course_params)
    @course.instructor = @instructor

    if @course.save
      AdminRequest.create! approvable: @course
      redirect_to @course
    else
      render :new
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def course_params
    params.require(:course).permit(:name, :start_date, :end_date, :student_limit, :instructor_id)
  end
end
