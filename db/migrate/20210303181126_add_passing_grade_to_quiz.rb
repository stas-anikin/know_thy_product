class AddPassingGradeToQuiz < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :correct_answers_to_pass, :integer, default: 0
  end
end
