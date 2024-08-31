class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids = Bid.all
    render json: @bids
  end

  def show
    @bid = Bid.find(params[:id])
    render json: @bid
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = current_user.bids.build(bid_params)
    if @bid.save
      render json: @bid, status: :created
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      render json: @bid
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    head :no_content
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :product_id)
  end
end
