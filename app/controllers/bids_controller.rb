class BidsController < ApplicationController
  before_action :authenticate_user!, only: [:participate, :create, :edit, :update, :destroy]

  def index
    @bids = Bid.where('end_time >= ?', Time.current) # Filtrer les enchères en cours
  end

  def participate
    @bid = Bid.find(params[:id])
    if user_signed_in?
      # Logique pour permettre à l'utilisateur de participer à l'enchère
      current_user.bids << @bid # Exemple simple, ajouter l'enchère à l'utilisateur
      flash[:notice] = "Vous participez maintenant à l'enchère."
      redirect_to bid_path(@bid)
    else
      flash[:alert] = "Vous devez être connecté pour participer à une enchère."
      redirect_to new_user_session_path
    end
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = current_user.bids.build(bid_params)
    if @bid.save
      flash[:notice] = "Enchère créée avec succès."
      redirect_to @bid
    else
      flash[:alert] = "Erreur lors de la création de l'enchère."
      render :new
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      flash[:notice] = "Enchère mise à jour avec succès."
      redirect_to @bid
    else
      flash[:alert] = "Erreur lors de la mise à jour de l'enchère."
      render :edit
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    flash[:notice] = "Enchère supprimée avec succès."
    redirect_to bids_path
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :product_id)
  end
end
