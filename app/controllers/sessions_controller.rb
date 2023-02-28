class SessionsController < ApplicationController
include SessionHelper
  def create
    session[:user_id] = find_or_create_from_auth_hash(request.env["omniauth.auth"])
    redirect_to user_path(session[:user_id])
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end

  private

  def find_or_create_from_auth_hash(auth_hash)
    user = UserFacade.find_by_google_uid(auth_hash[:uid])
    if user
      session[:user_id] = user.id
    else
      user = UserFacade.create_user(user(auth_hash))
      session[:user_id] = user.id 
    end
  end
end