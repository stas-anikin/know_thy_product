class QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.new
  end

  def index
    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions
  end

  def show
    p params
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.find params[:id]
    @answer = Answer.new
  end

  def update
    set_answer_params

    if @result = Result.find_by(quiz_id: @quiz.id, user_id: current_user.id)
      p @result.attempted_questions
      @result.attempted_questions.uniq
      p @result.attempted_questions.uniq
    else
      create_new_result
    end
    @result.attempted_questions << @question.id

    if @option.is_correct
      @result.number_of_correct_answers += 1

      @result.answered_correctly_questions << @question.id
    end

    attempted_questions_array = []
    @result.attempted_questions.each do |question|
      attempted_questions_array << question.to_i
    end
    all_questions_array = []
    @quiz.questions.each do |question|
      all_questions_array << question.id
    end

    @next_question = all_questions_array.difference(attempted_questions_array).sample

    if @result.save && @next_question
      redirect_to quiz_question_path(@quiz, @next_question), notice: "Your answer has been posted"
    elsif @result.save && @next_question == nil
      redirect_to result_path(@result), notice: "You have answered all the questions"
    else
      redirect_to quiz_path(@question.quiz), alert: "Could not post an answer"
    end
  end

  def create_answer
    set_answer_params

    if @result = Result.find_by(quiz_id: @quiz.id, user_id: current_user.id)
      p @result.attempted_questions
      @result.attempted_questions.uniq
      p @result.attempted_questions.uniq
    else
      create_new_result
    end
    @result.attempted_questions << @question.id

    if @option.is_correct
      @result.number_of_correct_answers += 1

      @result.answered_correctly_questions << @question.id
    end

    attempted_questions_array = []
    @result.attempted_questions.each do |question|
      attempted_questions_array << question.to_i
    end
    all_questions_array = []
    @quiz.questions.each do |question|
      all_questions_array << question.id
    end

    @next_question = all_questions_array.difference(attempted_questions_array).sample

    if @result.save && @next_question
      redirect_to quiz_question_path(@quiz, @next_question), notice: "Your answer has been posted"
    elsif @result.save && @next_question == nil
      redirect_to result_path(@result), notice: "You have answered all the questions"
    else
      redirect_to quiz_path(@question.quiz), alert: "Could not post an answer"
    end
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.new question_params
    @question.quiz = @quiz

    if @question.save
      redirect_to quiz_question_options_path(@quiz, @question), notice: "question posted"
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
    params.require(:question).permit(:name, :options, :result)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id, :quiz_id, :result)
  end

  def set_answer_params
    @user = current_user
    @option = Option.find params[:option_id]
    @question = @option.question
    # @answer = Answer.new
    # @answer = Answer.create(
    #   question_id: @question.id,
    #   option_id: @option.id,
    #   is_correct: @option.is_correct,
    # )
    @quiz = @question.quiz
  end

  def create_new_result
    @result = Result.create(
      quiz_id: @quiz.id,
      user_id: current_user.id,
      number_of_questions: @quiz.number_of_questions,
      number_of_correct_answers: 0,
    )
  end
end
