class RemovingExtraColumnsFromAnswersOptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :option_id
    remove_column :options, :is_correct
  end
end
