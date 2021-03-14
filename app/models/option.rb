class Option < ApplicationRecord
  belongs_to :question, optional: true
  has_one :answer, dependent: :destroy
end
