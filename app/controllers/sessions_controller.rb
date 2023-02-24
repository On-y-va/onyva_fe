class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_email = auth_hash[:info][:email] 
    conn = Faraday.new
    response = conn.get("http://localhost:5000/api/v1/users", email: user_email)
    session[:user_id] = response[:user][:id]
    redirect_to user_path(session[:user_id])
  end
end