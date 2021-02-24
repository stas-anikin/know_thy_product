class Answer < ApplicationRecord
  belongs_to :question_answers
  belongs_to :question
end
