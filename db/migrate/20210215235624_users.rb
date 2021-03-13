class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.timestamp :stard_date
      t.timestamps
      t.boolean :is_admin, default: false
      t.boolean :is_superuser, default: false
    end
  end
end
