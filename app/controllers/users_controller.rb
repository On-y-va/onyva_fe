class UsersController < ApplicationController
  include UserHelper
  before_action :current_user
  before_action :authenticate

  def show
    # need error handling if no trips
    if current_user
      @user = current_user
      @pending_trips = UserFacade.user_trips(@user.id, 0)
      @upcoming_trips = UserFacade.user_trips(@user.id, 1)
    else
      @user = UserFacade.one_user(session[:user_id])
      @pending_trips = UserFacade.user_trips(@user.id, 0)
      @upcoming_trips = UserFacade.user_trips(@user.id, 1)
    end
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
  