class TariffesController < ApplicationController
  def show
    @tariffe = TariffeDecorator.new Tariffe.find(params[:id])
  end
end
