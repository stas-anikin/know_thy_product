class Role < ApplicationRecord
  belongs_to :department
  belongs_to :user
end
