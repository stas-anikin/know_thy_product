class DeletingRoleIdFromDepartments < ActiveRecord::Migration[6.1]
  def change
    remove_column :departments, :role_id
    remove_column :roles, :user_id
  end
end
