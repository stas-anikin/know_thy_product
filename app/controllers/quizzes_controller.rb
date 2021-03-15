class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end

  def index
    @pagy, @quizzes = pagy(Quiz.all, items: 10)
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user #assigning the creator of the quiz
    @quiz.number_of_questions.times do #for each of the questions we will create an instance of a question with 4 options each
      q = Question.create()
      4.times do
        q.options << Option.new
      end
      @quiz.questions << q #we're assigning each question
    end

    if @quiz.save
      redirect_to quiz_questions_path(@quiz.id)
    else
      render :new
    end
  end

  def show
    @questions = @quiz.questions
    @question = @questions.first
    @options = @question.options
    # we need to check if the current user has already taken this quiz
    @result = Result.find_by(quiz_id: @quiz.id, user_id: current_user.id)
  end

  def edit
    @question = Question.new
    @options = @question.options
  end

  def update
    #setting every unchecked option to false
    @quiz.questions.each { |question|
      question.options.each { |option|
        option.update(is_correct: false)
      }
    }
    if @quiz.update quiz_params
      redirect_to quiz_questions_path(@quiz.id)
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:id]
  end

  def quiz_params
    params.require(:quiz).permit(:name, :number_of_questions, :correct_answers_to_pass, questions_attributes: [:id, :quiz_id, :name, :number_of_options, options_attributes: [:id, :question_id, :name, :is_correct]])
  end
end
