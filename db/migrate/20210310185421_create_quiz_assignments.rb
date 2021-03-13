class CreateQuizAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_assignments do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
