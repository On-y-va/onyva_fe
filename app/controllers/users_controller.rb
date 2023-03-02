class UsersController < ApplicationController
  include UserHelper
  before_action :current_user
  before_action :authenticate

  def show
    @user = current_user
    @pending_trips = UserFacade.user_trips(@user.id, 0)
    @upcoming_trips = UserFacade.user_trips(@user.id, 1)
  end

  def edit
    @user = current_user
  end

  def update
    UserFacade.update_user(params[:id], update_params)
    redirect_to user_path(params[:id])
  end

  def destroy
    # flash[:notice] = "User was successfully deleted."
  end
end
  