class DepartmentRolesAssignment < ApplicationRecord
  belongs_to :department
  belongs_to :role
end
