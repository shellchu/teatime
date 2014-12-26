class EventsController < ApplicationController
  before_action :require_login

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @shop = @event.shop
    @orders = @event.orders
  end
end
