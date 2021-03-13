class DeletingNameColumnFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :name
  end
end
