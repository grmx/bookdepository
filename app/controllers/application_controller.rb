class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      current_user.orders.build
    end
  end
end
