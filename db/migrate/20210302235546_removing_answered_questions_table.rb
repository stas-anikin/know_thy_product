class RemovingAnsweredQuestionsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :answered_questions
  end
end
