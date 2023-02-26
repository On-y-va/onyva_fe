class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id]
      if @current_user == nil
        conn = Faraday.new
        response = conn.get("https://onyva-be.herokuapp.com/api/v1/users/find", email: user_email)
        @current_user = JSON.parse(response.body, symbolize_names: true)[:data]
        # User.find(session[:user_id])
      else
        @current_user
      end
    end

    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
