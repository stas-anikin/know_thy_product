class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions
  end

  def show
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.find params[:id]
    @answer = Answer.new
  end

  def create_answer
    @question = Question.find params[:id]
    @option = Option.find params[:option_id]
    @answer = Answer.new
    @answer.question_id = @question.id
    @answer.option_id = @option.id
    if @answer.save
      redirect_to quiz_path(@question.quiz), notice: "Your answer has been posted"
    else
      redirect_to quiz_path(@question.quiz), alert: "Could not post an answer"
    end
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
    params.require(:question).permit(:name, :options)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id)
  end
end
