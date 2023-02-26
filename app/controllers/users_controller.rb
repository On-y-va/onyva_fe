class UsersController < ApplicationController
  
  def show
    user_id = params[:id]
    @user = UserFacade.one_user(user_id)
    
    # @pending_trips = User.facade.user_trips("pending") 
    # @accepted_trips = User.facade.user_trips("accepted")
  end

  def edit
    user_id = params[:id]
    @user = UserFacade.one_user(user_id)
  end

  def update
    update_params = ({
      "first_name": params[:first_name],
      "last_name": params[:last_name],
      "phone_number": params[:phone_number],
      "emergency_contact_name": params[:emergency_contact_name],
      "emergency_contact_phone_number": params[:emergency_contact_phone_number]
      })
    user_id = params[:id].to_i
    conn = Faraday.new
    # response = conn.patch("https://onyva-be.herokuapp.com/api/v1/users/1", {user: update_params})
    response = conn.patch("http://localhost:5000/api/v1/users/1", "user": update_params)
    user = JSON.parse(response.body, symbolize_names: true)[:data]
    # user = User.new(data)
    redirect_to user_path(user[:id])
  end

  def new
  end

  def create
    user_params = ({
      "first_name": params[:first_name],
      "last_name": params[:last_name],
      "phone_number": params[:phone_number],
      "email": params[:email],
      "password": params[:password],
      "password_confirmation": params[:password_confirmation]
      })
      
      conn = Faraday.new
      response = conn.post("https://onyva-be.herokuapp.com/api/v1/users", user: user_params)
      user = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to user_path(user[:id])
  end

  def destroy
    user_id = params[:id]
    redirect_to root_path
    flash[:notice] = "User was successfully deleted."
  end
end
  