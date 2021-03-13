class RenameUserRolesAssignment < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_roles_assignment, :user_roles_assignments
  end
end
