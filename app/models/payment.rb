class Payment < ApplicationRecord
    # Associations
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    belongs_to :user
    belongs_to :product
    
  
  
    # Validations
    validates :amount, :payment_date, :payment_method, :status, presence: true
end
  