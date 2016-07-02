class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_course
      if current_lesson.section.course.user != current_user
          redirect_to course_path(current_lesson.section.course), alert: 'You must first enroll in the course'
      end
  end

  helper_method :current_lesson
  def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
  end

end
