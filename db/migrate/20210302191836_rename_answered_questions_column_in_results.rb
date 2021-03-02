class RenameAnsweredQuestionsColumnInResults < ActiveRecord::Migration[6.1]
  def change
    rename_column :results, :answered_question, :answered_questions
  end
end
