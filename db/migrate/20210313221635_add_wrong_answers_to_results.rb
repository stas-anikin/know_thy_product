class AddWrongAnswersToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :wrong_answers, :text, array: true, default: []
  end
end
