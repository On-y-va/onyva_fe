class TripAttendeesController < ApplicationController
  def update
    TripAttendeeFacade.update_trip_attendee(params[:user_id], params[:trip_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    TripAttendeeFacade.delete_trip_attendee(params[:user_id], params[:trip_id])
    redirect_to user_path(params[:user_id])
  end
end
