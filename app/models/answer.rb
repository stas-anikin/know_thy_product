class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :result, optional: true
  belongs_to :option
end
