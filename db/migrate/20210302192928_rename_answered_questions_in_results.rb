class RenameAnsweredQuestionsInResults < ActiveRecord::Migration[6.1]
  def change
    rename_column :results, :answered_questions, :attempted_questions
  end
end
