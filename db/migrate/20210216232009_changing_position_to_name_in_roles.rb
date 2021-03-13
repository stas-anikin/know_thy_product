class ChangingPositionToNameInRoles < ActiveRecord::Migration[6.1]
  def change
    rename_column :roles, :position, :name
  end
end
