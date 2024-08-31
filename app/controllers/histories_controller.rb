class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = History.all
    render json: @histories
  end

  def show
    @history = History.find(params[:id])
    render json: @history
  end

  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    if @history.save
      render json: @history, status: :created
    else
      render json: @history.errors, status: :unprocessable_entity
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    if @history.update(history_params)
      render json: @history
    else
      render json: @history.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
    head :no_content
  end

  private

  def history_params
    params.require(:history).permit(:user_id, :product_id, :action, :timestamp)
  end
end
