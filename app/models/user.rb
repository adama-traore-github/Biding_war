class User < ApplicationRecord
    # Associations
    has_many :products, foreign_key: :seller_id
    has_many :bids
    has_many :histories
    has_many :payments
    has_many :reviews
    has_many :notifications
  
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
  
    # Authentication
    has_secure_password
  
    # Enum for role
    enum role: { buyer: 0, seller: 1, both: 2 }
  end
  