class AddCorrectAnswerToQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :is_correct
    remove_column :answers, :question_id
  end
end
