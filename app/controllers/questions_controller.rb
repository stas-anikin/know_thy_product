class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.new question_params
    @question.quiz = @quiz

    if @question.save
      redirect_to quiz_path(@quiz), notice: "question posted"
    else
      @question = @quiz.questions.order(created_at: :desc)
      render "/quizzes/edit"
    end
  end

  def destroy
    @question = question.find params[:format]
    @question.destroy
    redirect_to quiz_path(@question.quiz), notice: "question deleted"
  end

  private

  def question_params
    params.require(:question).permit(:name, :answer)
  end
end
