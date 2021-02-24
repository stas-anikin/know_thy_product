class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions,
                                allow_destroy: true,
                                reject_if: proc { |att| att["name"].blank? }

  has_many :options, through: :questions
  has_many :results
end
