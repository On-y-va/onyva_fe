class TripsController < ApplicationController

  def show
    trip_id = params[:id]
    @trip = TripFacade.one_trip(trip_id)
  end

  def new
  end
end