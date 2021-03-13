class DeleteForeignKeyIds < ActiveRecord::Migration[6.1]
  def change
    remove_column :roles, :department_id
    remove_column :users, :role_id
  end
end
