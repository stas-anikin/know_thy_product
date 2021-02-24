class AddingNumberOfQuestionsNumberOfCorrectAnswersToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :number_of_questions, :integer
    add_column :results, :number_of_correct_answers, :integer
  end
end
