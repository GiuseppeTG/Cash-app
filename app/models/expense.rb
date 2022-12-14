class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
