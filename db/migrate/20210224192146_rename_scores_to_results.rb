class RenameScoresToResults < ActiveRecord::Migration[6.1]
  def change
    rename_table :scores, :results
  end
end
