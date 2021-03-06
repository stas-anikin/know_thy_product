class Department < ApplicationRecord
  has_many :users, through: :roles
  has_many :roles, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
