class QuizAssignmentsController < ApplicationController
  def new
    @quiz_assignment = QuizAssignment.new
  end

  def index
    @quiz_assignments = QuizAssignment.all
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
    @quiz_assignments = QuizAssignment.where(role_id: current_user.role.id)
  end

  private

  def find_quiz_assignment
    @quiz_assignment = QuizAssignment.find params[:id]
  end

  def quiz_assignment_params
    params.require(:quiz_assignment).permit(:quiz_id, :role_id)
  end
end
