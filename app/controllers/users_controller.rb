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
end
