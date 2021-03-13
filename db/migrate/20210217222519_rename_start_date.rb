class RenameStartDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :stard_date, :start_date
  end
end
