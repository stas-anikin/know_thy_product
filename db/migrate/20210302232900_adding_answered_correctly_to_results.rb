class AddingAnsweredCorrectlyToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :answered_correctly_questions, :text, array: true, default: []
  end
end
