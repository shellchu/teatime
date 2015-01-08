class ShopsController < ApplicationController
  before_action :require_login

  def show
    @shop = Shop.find(params[:id])
    @beverages = @shop.beverages
  end
end
