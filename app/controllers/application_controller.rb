class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pagy::Frontend
  before_action :outstanding_quizzes

  private

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  helper_method(:current_user)

  def user_signed_in?
    current_user.present?
  end

  def outstanding_quizzes
    if user_signed_in? && current_user.role
      # first we are going to find all the quizzes assigned to the role of the current user
      quiz_assignments = QuizAssignment.where(role_id: current_user.role.id)
      # then we will grab their id's and store them in an array
      quiz_ids = []
      quiz_assignments.each do |qa|
        quiz_ids << qa.quiz_id
      end
      # then we are going to find all the results for the current user
      completed_quizzes = Result.where(user_id: current_user.id)
      # and store the quiz id's of these results in another array
      completed_quizzes_ids = []
      completed_quizzes.each do |cq|
        completed_quizzes_ids << cq.quiz_id
      end
      # then we're going to find the difference between the two arrays and it will give us all the id's of quizzes the user has been assigned, but has not taken yet
      @unfinished_quizzes = quiz_ids.difference(completed_quizzes_ids)
    end
  end

  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
  end
end
