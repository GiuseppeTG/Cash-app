class User < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :role, presence: true

  has_many :expenses, dependent: :destroy
  has_many :groups, dependent: :destroy
end
