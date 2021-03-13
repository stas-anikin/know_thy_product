class LinkingQuizUserScore < ActiveRecord::Migration[6.1]
  def change
    add_reference :scores, :quiz, foreign_key: true
    add_reference :scores, :user, foreign_key: true
  end
end
