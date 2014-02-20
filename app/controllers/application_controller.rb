class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :calculator

  private

  def calculator
    @calculator ||= Tariffe::Calculator.new(params[:tariffe_calculator])
  end
end
