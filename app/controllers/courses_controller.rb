class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: error_response(@course), status: :unprocessable_entity
    end
  end

  def index
    @courses = Course.all.includes(:tutors)
    render json: { data: @courses},  include: :tutors
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, tutors_attributes: [:name, :bio])
  end

  def error_response(resource)
    if resource.is_a?(Course)
      { course: resource.errors }
    elsif resource.is_a?(Tutor)
      { tutor: resource.errors }
    else
      { errors: resource.errors }
    end
  end

end
