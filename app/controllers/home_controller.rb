class HomeController < ApplicationController
  def index
    @bids = Bid.all
  end
end
