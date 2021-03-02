class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
  has_many :answered_questions
end
