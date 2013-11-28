class WelcomeController < ApplicationController
  def index
    @tariffes = Tariff.active.ordered
  end
end
