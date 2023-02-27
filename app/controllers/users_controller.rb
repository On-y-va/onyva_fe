class UsersController < ApplicationController
  before_action :current_user

  def show
    @user = UserFacade.one_user(session[:user_id])
  end

  def edit
      @user = UserFacade.one_user(session[:user_id])
  end

  def update
      UserFacade.update_user(session[:id], update_params)
  end

  def destroy
    # flash[:notice] = "User was successfully deleted."
  end
end
  