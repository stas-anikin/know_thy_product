class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

  def new
    @quiz = Quiz.new
  end

  def index
    p "and here are the params #{params}"
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user

    if @quiz.save
      flash[:notice] = "Quiz created successfully."

      redirect_to quiz_questions_path(@quiz.id)
    else
      render :new
    end
  end

  def show
    p "and here are the params #{params}"
    @questions = @quiz.questions
    @question = @questions.first
    @options = @question.options
  end

  def edit
    @question = Question.new
    @options = @question.options
    # @answer = correct_answer
  end

  def update
    if @quiz.update quiz_params
      redirect_to quiz_path(@quiz.id), notice: "quiz edited successfully."
    else
      render :edit
    end
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:id]
  end

  def quiz_params
    params.require(:quiz).permit(:name, :number_of_questions)
      .permit(:name, question_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
