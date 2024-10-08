class Bid < ApplicationRecord
  has_many :bids
  # Associations
  belongs_to :user # Associe chaque enchère à un utilisateur
  belongs_to :product # Associe chaque enchère à un produit

  # Validation
  validates :amount, numericality: { greater_than: :previous_highest_bid } # Valide que le montant de l'enchère est supérieur à l'enchère précédente

  # Méthode pour obtenir l'enchère la plus élevée précédente
  def previous_highest_bid
    product.current_price # Retourne le prix actuel du produit comme étant l'enchère la plus élevée précédente
  end

  # Méthode pour vérifier si l'enchère est finalisée
  def finalized?
    finalized_at.present? && finalized_at <= Time.current # Vérifie si l'enchère est finalisée en fonction de la date de finalisation
  end

  #Ceci permet de desactivé le bouton de payement si le temps n'est pas ecoulé  
  def winner
    bids.order(amount: :desc).first.user if bids.any?
  end

  def ended?
    Time.current > self.end_time
  end
end
