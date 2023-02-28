class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # require 'pry'; binding.pry
    @current_user = UserFacade.one_user(session[:user_id]) if session[:user_id]
    # redirect_to root_path, status: :unauthorized if @current_user.nil?
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate
    redirect_to root_path unless user_signed_in?
  end
end
