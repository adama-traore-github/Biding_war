class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # Associations
  has_many :products, foreign_key: :seller_id
  has_many :bids
  has_many :histories
  has_many :payments
  has_many :reviews
  has_many :notifications

  # Enum for role
  enum role: { buyer: 0, seller: 1, both: 2 }

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true # Assurer que le rôle est présent
end
