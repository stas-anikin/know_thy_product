class AddingIsCorrectToOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :is_correct, :boolean
  end
end
