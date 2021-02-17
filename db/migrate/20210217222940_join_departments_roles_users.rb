class JoinDepartmentsRolesUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :department_id, :integer
    add_foreign_key :roles, :departments
    add_column :users, :role_id, :integer
    add_foreign_key :users, :roles
  end
end
