class ConnectUsersToRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles_assignment do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
    end
  end
end
