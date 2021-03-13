class ChangingNumberOfAnswersToNumberOfOptions < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :number_of_answers, :number_of_options
  end
end
