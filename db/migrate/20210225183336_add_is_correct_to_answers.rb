class AddIsCorrectToAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :options, :is_correct
    add_column :options, :is_correct, :boolean, default: false
  end
end
