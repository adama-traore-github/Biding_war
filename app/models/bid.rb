class Bid < ApplicationRecord
    # Associations
    belongs_to :user
    belongs_to :product
  
    # Validations
    validates :amount, :bid_date, presence: true
  end
  