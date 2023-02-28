class UsersController < ApplicationController
  include UserHelper
  before_action :current_user
  before_action :authenticate

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    UserFacade.update_user(session[:id], update_params)
  end

  def destroy
    # flash[:notice] = "User was successfully deleted."
  end
end
  