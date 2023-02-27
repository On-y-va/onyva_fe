class SessionsController < ApplicationController
  def create
    # session[:auth_hash] = request.env['omniauth.auth']
    # require 'pry'; binding.pry
    auth_hash = request.env['omniauth.auth'] 
    session[:uid] = auth_hash[:uid]
    if current_user
      # session[:auth_hash] = nil
      session[:user_id] = @current_user.id
      redirect_to user_path(session[:user_id])
    else
      # redirect_to(:controller => "users", :action => "create")
      # post request to BE to make new user with auth hash data
      # flash[:error] = "Please create an account to continue"
      # redirect_to users_new_path
      user = {
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name],
        email: auth_hash[:info][:unverified_email],
        uid: auth_hash[:uid]
      }
      conn = Faraday.new
      
      # response = conn.post("https://onyva-be.herokuapp.com/api/v1/users", user: user_params)
      response = conn.post("http://localhost:5000/api/v1/users", user: user)
      user = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to user_path(user[:id])
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end