class FlightsController < ApplicationController
  def index
    @trip_id = params[:trip_id]
    @flights = FlightsFacade.flights(@trip_id)
  end

  def new
  end

  def create
      conn = Faraday.new
      response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips/#{params[:trip_id]}/flights", flight: flight_params)
      # response = conn.post("http://localhost:5000/api/v1/trips/#{trip_id}/flights", flight: flight_params)
      flight = JSON.parse(response.body, symbolize_names: true)
      redirect_to trip_path(params[:trip_id])
  end

  def flight_params
    {
      "email": params[:email],
      "date": params[:date],
      "airline_code": params[:airline_code],
      "flight_number": params[:flight_number]
      } 
  end
end