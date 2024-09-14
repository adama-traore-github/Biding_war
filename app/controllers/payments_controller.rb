class PaymentsController < ApplicationController
  before_action :authenticate_user! # Assure que l'utilisateur est authentifié avant d'accéder aux actions

  def search
    # Récupère la requête de recherche et trouve les produits dont le nom correspond à la requête
    @query = params[:query]
    @products = Product.where('name LIKE ?', "%#{@query}%")
    render :index # Rendu de la vue index avec les résultats de la recherche
  end

  def index
    # Récupère tous les paiements et les renvoie au format JSON
    @payments = Payment.all
    render json: @payments
  end

  def show
    # Trouve un paiement par son ID et le renvoie au format JSON
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def new
    # Crée une nouvelle instance de paiement pour le formulaire
    @payment = Payment.new
    # Vérifie si l'enchère est terminée et que l'utilisateur actuel est le gagnant
    unless @auction.ended? && current_user == @auction.winner
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer ce paiement."
      redirect_to auction_path(@auction)
    end
  end

  def create
    # Crée une nouvelle instance de paiement avec les paramètres fournis
    @payment = Payment.new(payment_params)
    @auction = Auction.find(params[:auction_id])
    if @payment.save
      # Sauvegarde réussie, renvoie le paiement créé au format JSON avec le statut :created
      render json: @payment, status: :created
      #configuration de l'email de validation de mail de payement 
      PaymentMailer.payment_success_email(current_user, @auction).deliver_later
      flash[:notice] = "Paiement réussi ! Un email de confirmation a été envoyé."
      redirect_to auction_path(@auction)
    else
      # Échec de la sauvegarde, renvoie les erreurs au format JSON avec le statut :unprocessable_entity
      render json: @payment.errors, status: :unprocessable_entity
      flash[:alert] = "Échec du paiement."
      render :new
    end
    if @auction.ended? && current_user == @auction.winner
      # Logique de paiement Stripe ici...
    else
      flash[:alert] = "Paiement non autorisé."
      redirect_to auction_path(@auction)
    end
  end
  
  def edit
    # Trouve un paiement par son ID pour l'éditer
    @payment = Payment.find(params[:id])
  end

  def update
    # Trouve un paiement par son ID et le met à jour avec les paramètres fournis
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      # Mise à jour réussie, renvoie le paiement mis à jour au format JSON
      render json: @payment
    else
      # Échec de la mise à jour, renvoie les erreurs au format JSON avec le statut :unprocessable_entity
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # Trouve un paiement par son ID et le supprime
    @payment = Payment.find(params[:id])
    @payment.destroy
    # Renvoie une réponse vide avec le statut :no_content
    head :no_content
  end

  private

  def payment_params
    # Définit les paramètres autorisés pour un paiement
    params.require(:payment).permit(:user_id, :product_id, :amount, :status)
  end
end

