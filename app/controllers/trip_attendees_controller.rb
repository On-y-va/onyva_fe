class TripAttendeesController < ApplicationController
  def update
    user_id = params[:user_id]
    trip_id = params[:trip_id]
    conn = Faraday.new
    conn.patch("https://onyva-be.herokuapp.com/api/v1/users/#{user_id}/trips/#{trip_id}")
    # conn.patch("http://localhost:5000/api/v1/users/#{user_id}/trips/#{trip_id}")
    redirect_to user_path(user_id)
  end

  def destroy
    user_id = params[:user_id]
    trip_id = params[:trip_id]
    conn = Faraday.new
    conn.delete("https://onyva-be.herokuapp.com/api/v1/users/#{user_id}/trips/#{trip_id}")
    # conn.delete("http://localhost:5000/api/v1/users/#{user_id}/trips/#{trip_id}")
    redirect_to user_path(user_id)
  end
end
