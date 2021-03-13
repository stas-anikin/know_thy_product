class AddingScoreToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :score, :float
  end
end
