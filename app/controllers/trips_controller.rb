require 'date'
class TripsController < ApplicationController
  before_action :current_user
  before_action :authenticate

  def show
    @trip = TripFacade.one_trip(params[:id])
    @events = @trip.events
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
        "country": params[:country],
        "city": params[:city],
        "postcode": params[:postcode],
        "start_date": params[:start_date],
        "end_date": params[:end_date]
        })
      
      conn = Faraday.new
      response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips", trip: update_trip_params)
      # response = conn.post("http://localhost:5000/api/v1/trips", trip: update_trip_params)
      trip = JSON.parse(response.body, symbolize_names: true)[:data]
      redirect_to trip_path(trip[:id])
    end
  end

  def new
  end

  def create
    if (DateTime.parse(params[:start_date])) > (DateTime.parse(params[:end_date]))
      flash[:notice] = "Vacation end date must be after the vacation start date"
      redirect_to new_trip_path
    else
      trip_params = ({
        name: params[:name],
        country: params[:country],
        city: params[:city],
        postcode: params[:postcode],
        start_date: params[:start_date],
        end_date: params[:end_date],
        user_id: session[:user_id]
      })
      trip_params.delete_if { |k, v| v == "" } 
      conn = Faraday.new
      response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips", trip: trip_params)
      # response = conn.post("http://localhost:5000/api/v1/trips", trip: trip_params)
      trip = JSON.parse(response.body, symbolize_names: true)[:data]
      unless trip.nil? || trip.empty?
        redirect_to trip_path(trip[:id]) 
      else
        redirect_to new_trip_path
      end
    end
  end

  def destroy
    OnyvaService.destroy_trip(params[:id])
    redirect_to user_path(session[:user_id])
    flash[:notice] = "Trip was successfully deleted."
  end
end