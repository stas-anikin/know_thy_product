class Role < ApplicationRecord
  belongs_to :department
  has_many :quiz_assignments, dependent: :nullify
  has_many :users, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
