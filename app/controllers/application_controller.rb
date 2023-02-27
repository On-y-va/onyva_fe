class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= UserFacade.find_by_uid(session[:uid]) if session[:uid]
    redirect_to root_path, status: :unauthorized if @current_user.nil?
  end
end
