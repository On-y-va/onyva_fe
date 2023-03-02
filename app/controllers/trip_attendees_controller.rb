class TripAttendeesController < ApplicationController
  def update
    TripAttendeeFacade.update_trip_attendee(params[:user_id], params[:trip_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    user_id = params[:user_id]
    trip_id = params[:trip_id]
    conn = Faraday.new
    # response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips", trip: update_trip_params)
    conn.delete("http://localhost:5000/api/v1/users/#{user_id}/trips/#{trip_id}")
    redirect_to user_path(user_id)
  end
end
