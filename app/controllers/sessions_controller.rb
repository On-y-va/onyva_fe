class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_email = auth_hash[:info][:email] 
    conn = Faraday.new
    response = conn.get("https://onyva-be.herokuapp.com/api/v1/users/find", email: user_email)
    user = JSON.parse(response.body, symbolize_names: true)[:data]
    session[:user_id] = user[:id]
    redirect_to user_path(session[:user_id])
  end
end