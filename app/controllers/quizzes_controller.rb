class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end

  def index
    p "and here are the params #{params}"
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user
    @quiz.number_of_questions.times do
      q = Question.create()
      4.times do
        q.options << Option.new
      end
      @quiz.questions << q
    end

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
    @quiz.questions.each { |question|
      question.options.each { |option|
        option.update(is_correct: false)
      }
    }

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
    params.require(:quiz).permit(:name, :number_of_questions, questions_attributes: [:id, :quiz_id, :name, :number_of_options, options_attributes: [:id, :question_id, :name, :is_correct]])
  end
end
