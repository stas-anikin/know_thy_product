class RemovingScoreFromResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :results, :score
  end
end
