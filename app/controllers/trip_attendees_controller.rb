class TripAttendeesController < ApplicationController
  include TripAttendeeHelper
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

  def new
    @trip = TripFacade.one_trip(params[:trip_id])
  end

  def create
    TripAttendeeFacade.create_trip_attendees(params[:trip_id], user_emails)
    redirect_to trip_path(params[:trip_id])
  end
end
