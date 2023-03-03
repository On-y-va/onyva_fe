class FlightsController < ApplicationController
  before_action :current_user
  before_action :authenticate
  
  def index
    @trip_id = params[:trip_id]
    @flights = FlightFacade.flights(@trip_id)
  end

  def new
  end

  def create
    FlightFacade.create_flight(params[:trip_id], flight_params)
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