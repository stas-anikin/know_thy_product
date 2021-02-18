class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user

    if @quiz.save
      flash[:notice] = "Quiz created successfully."

      redirect_to quiz_path(@quiz.id)
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find params[:id]
    @questions = @quiz.questions
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
