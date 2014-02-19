class WelcomeController < ApplicationController
  helper_method :with_calculation?

  def index
    @calculator = Tariffe::Calculator.new(params[:tariffe_calculator])
    @tariffes   = Tariffe.includes(:bank).active.ordered
    @tariffes   = @tariffes.with_total_calculation(@calculator) if @calculator.valid?
  end
end
