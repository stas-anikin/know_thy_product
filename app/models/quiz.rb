class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions,
                                allow_destroy: true,
                                reject_if: proc { |att| att["name"].blank? }

  has_many :options, through: :questions
  has_many :results
  has_many :quiz_assignments
  validates :number_of_questions, numericality: { only_integer: true }
  validates :correct_answers_to_pass, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: ->(quiz) { quiz.number_of_questions }, message: "must be between 0 & total number of questions" }
end
