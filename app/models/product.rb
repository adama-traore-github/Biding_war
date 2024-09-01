class Product < ApplicationRecord
  # Associations
  belongs_to :seller, class_name: 'User'
  has_many :bids
  has_many :histories
  has_many :payments
  has_many :reviews
  belongs_to :category
  
  # Validations
  validates :name, presence: true
  validates :initial_price, :current_price, numericality: { greater_than_or_equal_to: 0 }

  # Validation personnalisée pour la catégorie
  validate :category_must_be_valid

  private
  
  def category_must_be_valid
    if category.nil? || !Category::VALID_CATEGORIES.include?(category.name)
      errors.add(:category, "must be one of the following: #{Category::VALID_CATEGORIES.join(', ')}")
    end
  end
end
