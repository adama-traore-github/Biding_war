class Product < ApplicationRecord
    # Associations
    belongs_to :seller, class_name: 'User'
    has_many :bids
    has_many :histories
    has_many :payments
    has_many :reviews
  
    # Validations
    validates :name, presence: true
    validates :initial_price, :current_price, numericality: { greater_than_or_equal_to: 0 }
  end
  