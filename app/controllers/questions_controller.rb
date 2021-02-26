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
    @user = current_user
    @question = Question.find params[:id]
    @option = Option.find params[:option_id]
    @answer = Answer.new
    @answer = Answer.create(
      question_id: @question.id,
      option_id: @option.id,
      is_correct: @option.is_correct,
    )
    @quiz = @question.quiz
    
    
    if @result = Result.find_by(quiz_id: @quiz.id, user_id: current_user.id)
      @answered_questions= @result.
      puts "I was found by find_by and is the result's user is #{@result.user.full_name} and the number of correct answers is #{@result.number_of_correct_answers}"
      score = @result.number_of_correct_answers
      if @answer.option_id == @question.options.find_by(is_correct: true).id
        score += 1
      end
      @result.number_of_correct_answers = score
    else
      @result = Result.create(
        quiz_id: @quiz.id,
        user_id: current_user.id,
        number_of_questions: @quiz.number_of_questions,
        number_of_correct_answers: 0,
      )

      # @result = Result.where(user_id: current_user.id, quiz_id: @quiz.id).first_or_create do |result|
      #   if @result.new_record?
      #     score = 0
      #   end
      #   result.quiz_id = @quiz.id
      #   result.user_id = current_user.id
      #   result.number_of_questions = @quiz.number_of_questions
      #   result.number_of_correct_answers = score
      # end
      puts "I am a new record and the result's user is #{@result.user.full_name} and the number of correct answers is #{@result.number_of_correct_answers}"
    end

    if @result.save
      flash[:notice] = "result posted"
    else
      flash[:alert] = "result not saved"
    end
    # puts "here is the result's user #{@result.user.full_name} and the number of correct answers is #{@result.number_of_correct_answers}"

    puts params
    if @answer.save
      # redirect_to quiz_question_path(:quiz_id => @quiz.id, :id => (@question.id + 1)), notice: "Your answer has been posted"
      @questions = @quiz.questions

      # @next_question = @result.questions
      redirect_to quiz_question_path(@quiz, @question, quiz_id: @quiz.id, id: @question) #, notice: "Your answer has been posted"

      # redirect_to quiz_question_path(@question.id + 1), notice: "Your answer has been posted"
    else
      redirect_to quiz_path(@question.quiz), alert: "Could not post an answer"
    end
  end

  # code below works
  # def create_answer
  #   @question = Question.find params[:id]
  #   @option = Option.find params[:option_id]
  #   @answer = Answer.new
  #   @answer = Answer.create(
  #     question_id: @question.id,
  #     option_id: @option.id,
  #     is_correct: @option.is_correct,
  #   )
  #   if @answer.save
  #     redirect_to quiz_question_path(@question.id), notice: "Your answer has been posted"
  #   else
  #     redirect_to quiz_path(@question.quiz), alert: "Could not post an answer"
  #   end
  # end

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
    params.require(:question).permit(:name, :options, :result)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id, :quiz_id, :result)
  end
end
