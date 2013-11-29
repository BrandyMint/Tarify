class WelcomeController < ApplicationController
  def index
    @tariffes = Tariffe.active.ordered
  end
end
