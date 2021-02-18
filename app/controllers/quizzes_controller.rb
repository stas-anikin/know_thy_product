class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def index
    @quizzes = Quiz.all
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
