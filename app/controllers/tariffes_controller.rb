class TariffesController < ApplicationController
  def show
    @order ||= Order.new order_params
    @tariffe ||= Tariffe.find(params[:id]).decorate
    @other_tariffes = @tariffe.siblings.with_total_calculation(calculator)
    render 'show'
  end

  def create
    @order = Order.new order_params

    if @order.save
      NotificationService.new.new_order(@order)
      redirect_to order_path(@order)
    else
      @tariffe = @order.tariffe.decorate
      show
    end
  end

  private

  def order_params
    params.fetch(:order, {}).permit!
  end
end
