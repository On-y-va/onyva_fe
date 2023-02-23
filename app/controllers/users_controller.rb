class UsersController < ApplicationController
  def show
    user_id = params[:id]
    @user = UserFacade.one_user(user_id)
  end

  def edit
  end

  def login_form
  end
  
  def new
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      # session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
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
      response = conn.post("http://localhost:5000/api/v1/users", user: user_params)
      user = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to user_path(user[:id].to_i)
    end
  end
end
  