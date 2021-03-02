class AddAnsweredQuestionsArrayColumnToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :answered_question, :text, array: true, default: []
  end
end
