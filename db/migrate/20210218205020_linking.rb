class Linking < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :option, foreign_key: true
  end
end
