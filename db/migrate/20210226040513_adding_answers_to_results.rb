class AddingAnswersToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference :results, :answer, foreign_key: true
  end
end
