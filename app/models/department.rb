class Department < ApplicationRecord
  has_many :users, through: :roles
end
