class WelcomeController < ApplicationController
  def index
    @tariffes   = Tariffe.includes(:bank)
                         .active
                         .ordered
                         .with_total_calculation(calculator)
  end
end
