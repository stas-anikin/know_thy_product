class QuizAssignment < ApplicationRecord
  belongs_to :quiz
  belongs_to :role
  has_many :users, through: :roles
end
