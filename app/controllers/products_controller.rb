class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # Assure que l'utilisateur est authentifié pour les actions de création, édition, mise à jour et suppression
  before_action :set_product, only: [:show, :edit, :update, :destroy] # Définit le produit pour les actions qui nécessitent un produit spécifique

  # Enchères en cours
  def index
    @categories = Category.all # Récupère toutes les catégories pour la vue
    @products = if params[:category_id]
                  @category = Category.find(params[:category_id]) # Trouve la catégorie si un ID de catégorie est fourni
                  @category.products.where('auction_end_date >= ?', Time.current) # Filtre les produits par date de fin d'enchère
                else
                  Product.where('auction_end_date >= ?', Time.current) # Filtre tous les produits par date de fin d'enchère
                end
  end

  # Historique des enchères terminées
  def historique
    @products = Product.where('auction_end_date < ?', Time.current) # Ne montre que les produits dont l'enchère est terminée
  end

  def new
    @product = Product.new # Crée une nouvelle instance de produit pour le formulaire de création
  end

  def create
    @product = current_user.products.build(product_params) # Construit un nouveau produit associé à l'utilisateur actuel
    if @product.save
      redirect_to root_path, notice: 'Produit créé avec succès.' # Redirection en cas de succès
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence # Affiche les erreurs en cas d'échec de la sauvegarde
      render :new # Rendu du formulaire de création avec les erreurs
    end
  end
  
  def edit
    # Prépare l'instance de produit pour le formulaire d'édition
  end

  def update
    if @product.update(product_params)
      render json: @product # Rendu du produit mis à jour au format JSON
    else
      render json: @product.errors, status: :unprocessable_entity # Rendu des erreurs de mise à jour au format JSON
    end
  end

  def destroy
    @product.destroy # Supprime le produit
    head :no_content # Réponse vide après la suppression
  end

  def category
    @category = Category.find_by(name: params[:name]) # Trouve la catégorie par nom
    if @category
      @products = @category.products.where('auction_end_date >= ?', Time.current) # Filtre les produits de la catégorie par date de fin d'enchère
    else
      @products = Product.where('auction_end_date >= ?', Time.current) # Filtre tous les produits par date de fin d'enchère si la catégorie n'est pas trouvée
    end
    render :index # Rendu de la vue index avec les produits filtrés
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id]) # Trouve un produit par ID
    if @product.nil?
      render json: { error: 'Produit non trouvé' }, status: :not_found # Affiche une erreur si le produit n'est pas trouvé
    end
  end

  def product_params
    # Définit les paramètres autorisés pour un produit
    params.require(:product).permit(:name, :description, :category_id, :initial_price, :auction_start_date, :auction_end_date, :image)
  end
end
