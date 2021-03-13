class DeleteAnswerIncorrectFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answer
    remove_column :questions, :incorrect1
    remove_column :questions, :incorrect2
    remove_column :questions, :incorrect3
  end
end
