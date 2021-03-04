class OptionsController < ApplicationController
  def index
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.find params[:question_id]
    @options = @question.options
  end
end
