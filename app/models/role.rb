class Role < ApplicationRecord
  belongs_to :department
  has_many :quiz_assignments
  has_many :users
  validates :name, presence: true
end
