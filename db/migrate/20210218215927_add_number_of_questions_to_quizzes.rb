class AddNumberOfQuestionsToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :number_of_questions, :integer
  end
end
