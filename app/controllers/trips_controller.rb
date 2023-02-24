class TripsController < ApplicationController

  def show
    trip_id = params[:id]
    @trip = TripFacade.one_trip(trip_id)
  end

  def new
  end

  def create
    trip_params = ({
      "name": params[:name],
      "country": params[:country],
      "city": params[:city],
      "postcode": params[:postcode],
      "place_id": params[:place_id]
      })
      
      conn = Faraday.new
      response = conn.post("http://localhost:5000/api/v1/trips", trip: trip_params)
      trip = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to trip_path(trip[:id])
  end
end