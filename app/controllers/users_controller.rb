class UsersController < ApplicationController
  include UserHelper
  # before_action :current_user

  def show
    if current_user
      @user = current_user
    else
      @user = UserFacade.one_user(session[:user_id])
    end
  end

  def edit
    if current_user
      @user = current_user
    else
      @user = UserFacade.one_user(session[:user_id])
    end
  end

  def update
    UserFacade.update_user(session[:id], update_params)
  end

  def destroy
    # flash[:notice] = "User was successfully deleted."
  end
end
  