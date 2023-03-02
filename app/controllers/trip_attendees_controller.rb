class TripAttendeesController < ApplicationController
  before_action :current_user
  before_action :authenticate

  def update
    TripAttendeeFacade.update_trip_attendee(params[:user_id], params[:trip_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    TripAttendeeFacade.delete_trip_attendee(params[:user_id], params[:trip_id])
    redirect_to user_path(params[:user_id])
  end
end
