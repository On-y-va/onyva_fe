class SessionsController < ApplicationController
include SessionHelper
  def create
    auth_hash = request.env['omniauth.auth'] 
    session[:google_uid] = auth_hash[:uid]
    if current_user
      session[:user_id] = @current_user.id
      redirect_to user_profile_path(session[:user_id])
    else
      user = UserFacade.create_user(user(auth_hash))
      session[:user_id] = user.id
      redirect_to user_profile_path(session[:user_id])
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:uid)
    @current_user = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end