class Roles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :position
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
    end
  end
end
