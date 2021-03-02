class AnsweredQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :result, optional: true
  belongs_to :user
end
