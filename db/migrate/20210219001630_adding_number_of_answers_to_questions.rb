class AddingNumberOfAnswersToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :number_of_answers, :integer
  end
end
