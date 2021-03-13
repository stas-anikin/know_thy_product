class DroppingQuestionsAnswersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :question_answers
  end
end
