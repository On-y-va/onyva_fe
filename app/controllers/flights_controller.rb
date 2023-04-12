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
    flight = FlightFacade.create_flight(params[:trip_id], flight_params)
    if flight.nil? || flight.status.nil?
      flash[:notice] = "Flight could not be created"
      redirect_to new_trip_flight_path(params[:trip_id])
    else
      flash[:notice] = "Flight successfully created"
      redirect_to trip_flights_path(params[:trip_id])
    end
  end

  def edit
    @flight = FlightFacade.one_flight(params[:trip_id], params[:id])
    @trip = TripFacade.one_trip(params[:trip_id])
  end

  def update
    FlightFacade.update_flight(params[:trip_id], params[:id], flight_update_params)
    flash[:notice] = "Flight successfully updated"
    redirect_to trip_flights_path(params[:trip_id])
  end

  def destroy
    FlightFacade.delete_flight(params[:trip_id], params[:id])
    flash[:notice] = "Flight successfully deleted"
    redirect_to trip_flights_path(params[:trip_id])
  end

  def flight_params
    {
      "user_email": params[:email],
      "date": params[:date],
      "flight_number": params[:flight_number]
      } 
  end

  def flight_update_params
    {
      "date": params[:date],
      "flight_number": params[:flight_number]
      } 
  end
end