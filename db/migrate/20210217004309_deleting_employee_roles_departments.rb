class DeletingEmployeeRolesDepartments < ActiveRecord::Migration[6.1]
  def change
    drop_table :employee_roles_departments
  end
end
