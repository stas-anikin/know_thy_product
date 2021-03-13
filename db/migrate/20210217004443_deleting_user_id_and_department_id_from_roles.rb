class DeletingUserIdAndDepartmentIdFromRoles < ActiveRecord::Migration[6.1]
  def change
    remove_column :roles, :user_id
    remove_column :roles, :department_id
  end
end
