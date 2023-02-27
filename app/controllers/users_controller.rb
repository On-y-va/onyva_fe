class UsersController < ApplicationController
  before_action :current_user

  def show
    @user = UserFacade.one_user(session[:user_id])
  end

  def edit
      @user = UserFacade.one_user(session[:user_id])
  end

  def update
      UserFacade.update_user(session[:id])
  end

  def destroy
    # flash[:notice] = "User was successfully deleted."
  end

  private
  def update_params
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      emergency_contact_name: params[:emergency_contact_name],
      emergency_contact_phone_number: params[:emergency_contact_phone_number]
      }
  end
end
  