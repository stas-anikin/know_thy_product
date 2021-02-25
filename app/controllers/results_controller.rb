class ResultsController < ApplicationController
  def new
  end

  def show
    @result = Result.find params[:id]
    @user = current_user
    @quiz = @result.quiz
    @questions = @quiz.questions
  end

  def create
    @user = current_user
    @quiz = Quiz.find params[:quiz_id]
    @score = percentage_score
    @result = Result.new result_params
    if @result.save
      flash[:notice] = "result posted"
      redirect_to result_path(@result.id)
    else
      redirect_to quiz_questions_path(@quiz.id)
    end
  end

  private

  def result_params
    params.require(:result).permit(:quiz_id, :user_id, :score)
  end

  def percentage_score
    @quiz = Quiz.find(params[:id])
    correct_answers = 0
    number_of_questions = @quiz.number_of_questions
    @quiz.questions.each do |question|
      question.options.each do |option|
        if option.is_correct == true
          correct_answers += 1
        end
      end
    end
    score = (correct_answers.to_f / number_of_questions.to_f * 100.0).round(2)
  end
end
