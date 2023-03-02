class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user = UserFacade.one_user(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate
    if !user_signed_in?
      flash[:alert] = "Authentication failed"
      redirect_to root_path
    end
  end
end
