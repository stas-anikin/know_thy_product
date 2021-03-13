module QuizzesHelper
  def percentage_score
    @quiz = Quiz.find(params[:id])
    correct_answers = 0
    @quiz.questions.each do |question_id, option_id| # q_id means question_id and s_v means submitted_value
      question = Question.find(question_id)
      if question.op.answer_text == s_v.downcase.strip
        correct_answers += 1
      end
    end
    score = (correct_answers.to_f / number_of_questions.to_f * 100.0).round(2)
  end
end
