class ConnectDepartmentsAndRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :department_roles_assignments do |t|
      t.references :department, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
    end
  end
end
