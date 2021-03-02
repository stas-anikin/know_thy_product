class Result < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
  has_many :answers
  has_many :answered_questions
end
