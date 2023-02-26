class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_email = auth_hash[:info][:email] 
    if current_user
      session[:user_id] = user[:id]
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Please create an account to continue"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end