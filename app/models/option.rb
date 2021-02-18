class Option < ApplicationRecord
  belongs_to :question
  has_one :answer
end
