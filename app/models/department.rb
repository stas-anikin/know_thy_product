class Department < ApplicationRecord
  has_many :roles, dependent: :destroy
end
