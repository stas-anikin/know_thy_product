class DroppingDeprtmentsUsersRolesJointTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_roles_assignments
    drop_table :department_users_assignments
    drop_table :department_roles_assignments
  end
end
