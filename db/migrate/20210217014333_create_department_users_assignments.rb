class CreateDepartmentUsersAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :department_users_assignments do |t|

      t.timestamps
    end
  end
end
