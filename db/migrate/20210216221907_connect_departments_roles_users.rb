class ConnectDepartmentsRolesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_roles_departments do |t|
      t.belongs_to :department
      t.belongs_to :users
      t.belongs_to :roles
    end
  end
end
