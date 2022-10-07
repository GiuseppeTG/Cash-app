class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :photo, presence: true
  validates :role, presence: true

  has_many :expenses, dependent: :destroy
  has_many :groups, dependent: :destroy
end
