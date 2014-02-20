class WelcomeController < ApplicationController
  def index
    @calculator = Tariffe::Calculator.new(params[:tariffe_calculator])
    @tariffes   = Tariffe.includes(:bank)
                         .active
                         .ordered
                         .with_total_calculation(@calculator)
  end
end
