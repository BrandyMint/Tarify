class TariffesController < ApplicationController
  def show
    @order ||= Order.new order_params
    @tariffe ||= decorate_tariffe params[:id]
  end

  def create
    @order = Order.new order_params

    if @order.save
      NotificationService.new.new_order(@order)
      redirect_to order_path(@order)
    else
      @tariffe = decorate_tariffe @order.tariffe_id
      render 'show'
    end
  end

  private

  def order_params
    params.fetch(:order, {}).permit!
  end

  def decorate_tariffe id
    Tariffe.find(id).decorate
  end
end
