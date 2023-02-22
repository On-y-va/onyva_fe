class UsersController < ApplicationController
  def show
    user_id = params[:id]
    @user = UserFacade.one_user(user_id)
  end
end
