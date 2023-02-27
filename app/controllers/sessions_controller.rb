class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth'] 
    session[:uid] = auth_hash[:uid]
    if current_user
      session[:user_id] = @current_user.id
      redirect_to profile_path(session[:user_id])
    else
      user = UserFacade.create_user(user)
      redirect_to user_path(user.id)
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end