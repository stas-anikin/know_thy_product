class Role < ApplicationRecord
  has_many :users, through: :user_roles_assignment
end
