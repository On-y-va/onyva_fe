class TripsController < ApplicationController
  include TripHelper
  before_action :current_user
  before_action :authenticate

  def show
    @user = current_user
    @trip = TripFacade.one_trip(params[:id])
    @events = @trip.events
    @users = TripFacade.trip_users(params[:id])
    @most_popular_event = TripFacade.most_popular_event(params[:id])
  end
  
  def edit
    @trip = TripFacade.one_trip(params[:id])
  end

  def update
    if (DateTime.parse(params[:start_date])) > (DateTime.parse(params[:end_date]))
      flash[:notice] = "Vacation end date must be after the vacation start date"
      redirect_to new_trip_path
    else
      update_trip_params = ({
        "name": params[:name],
        "start_date": params[:start_date],
        "end_date": params[:end_date]
        })
      
      conn = Faraday.new
        # response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips", trip: update_trip_params)
      response = conn.patch("http://localhost:5000/api/v1/trips/#{params[:id]}", trip: update_trip_params)
      trip = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to trip_path(trip[:id])
    end
  end

  def new
  end

  def create
    trip = TripFacade.create_trip(trip_params)
    unless trip.trip_id.nil?
      flash[:notice] = "Trip successfully created."
      redirect_to trip_path(trip.trip_id) 
    else
      flash[:notice] = "Trip could not be created, all fields must filled out & vacation end date must be after vacation start date."
      redirect_to new_trip_path
    end
  end

  def destroy
    OnyvaService.destroy_trip(params[:id])
    redirect_to user_path(session[:user_id])
    flash[:notice] = "Trip was successfully deleted."
  end
end