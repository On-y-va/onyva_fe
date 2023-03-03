class SessionsController < ApplicationController
include SessionHelper

  def create
    session[:user_id] = find_or_create_from_auth_hash(request.env["omniauth.auth"])
    redirect_to user_path(session[:user_id])
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end