class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:query]
    @products = Product.where('name LIKE ?', "%#{@query}%")
    render :index
  end
  
  def index
    @payments = Payment.all
    render json: @payments
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    head :no_content
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :product_id, :amount, :status)
  end
end
