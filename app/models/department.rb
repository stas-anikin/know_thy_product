class Department < ApplicationRecord
  has_many :users, through: :department_users_assignment
  has_many :roles, through: :department_roles_assignment
  has_many :department_roles_assignments
  has_many :department_users_assignments
end
