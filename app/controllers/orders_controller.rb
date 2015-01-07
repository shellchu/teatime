class OrdersController < ApplicationController
  before_action :require_login

  def new
    @event = Event.find(params[:event_id])
    @order = @event.orders.build
  end

  def create
    @event = Event.find(params[:event_id])
    @order = @event.orders.build(order_params)
    @order.user = current_user
    if @order.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @order = @event.orders.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @order = @event.orders.find(params[:id])
    if @order.update(order_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  protected
  def order_params
    params.require(:order).permit(:beverage_id, :hot, :ice, :sugar)
  end
end
