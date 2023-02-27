class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    require 'pry'; binding.pry
    @current_user ||= UserFacade.find_by_uid(session[:uid]) if session[:uid]
    # @current_user ||= UserFacade.find_user_by_email(session[:user_email]) if session[:user_email]
    # @current_user ||= Userfacade.one_user(params[:id]) 
    # session[:user_email] = nil
    # session[:user_id]= @current_user.id if @current_user
    # @current_user
  end
end
