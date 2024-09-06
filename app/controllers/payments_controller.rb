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
  end

  def create
    # Crée une nouvelle instance de paiement avec les paramètres fournis
    @payment = Payment.new(payment_params)
    if @payment.save
      # Sauvegarde réussie, renvoie le paiement créé au format JSON avec le statut :created
      render json: @payment, status: :created
    else
      # Échec de la sauvegarde, renvoie les erreurs au format JSON avec le statut :unprocessable_entity
      render json: @payment.errors, status: :unprocessable_entity
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
