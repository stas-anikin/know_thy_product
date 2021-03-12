class QuizAssignmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @quiz_assignment = QuizAssignment.new
  end

  def index
    @pagy, @quiz_assignments = pagy(QuizAssignment.all, items: 10)
  end

  def create
    @quiz_assignment = QuizAssignment.new quiz_assignment_params

    if @quiz_assignment.save
      flash[:notice] = "Quiz assigned successfully."
      redirect_to quiz_assignment_path(@quiz_assignment.id)
    else
      render :new
    end
  end

  def show
    @quiz_assignment = QuizAssignment.find params[:id]
  end

  def user_assignments
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

  private

  def find_quiz_assignment
    @quiz_assignment = QuizAssignment.find params[:id]
  end

  def quiz_assignment_params
    params.require(:quiz_assignment).permit(:quiz_id, :role_id)
  end
end
