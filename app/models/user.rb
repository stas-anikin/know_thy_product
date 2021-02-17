class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  # has_many :roles
  # belongs_to :departments
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
