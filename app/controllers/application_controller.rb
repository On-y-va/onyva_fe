class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= UserFacade.find_user_by_email(session[:user_email]) if session[:user_email]
    session[:user_email] = nil
    session[:user_id]= @current_user.id
  end
end
