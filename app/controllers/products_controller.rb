class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end
  end

  def show
    render json: @product
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  def category
    @category = Category.find_by(name: params[:name])
    if @category
      @products = @category.products
    else
      @products = Product.all
    end
    render :index
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :initial_price, :current_price, :category_id)
  end
end
