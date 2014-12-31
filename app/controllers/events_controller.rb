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

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to home_path
    else
      render :new
    end
  end

  protected
  def event_params
    params.require(:event).permit(:shop_id, :end_time)
  end
end
