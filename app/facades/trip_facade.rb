class TripFacade
  def self.one_trip(id)
    result = OnyvaService.one_trip(id)
    trip = Trip.new(result)
  end

  def self.create_trip(trip)
    result = OnyvaService.create_trip(trip)
    Trip.new(result)
  end

  def self.update_trip(trip_id, update_trip_params)
    result = OnyvaService.update_trip(trip_id, update_trip_params)
    # conn = Faraday.new
    # response = conn.post("https://onyva-be.herokuapp.com/api/v1/trips", trip: update_trip_params)
    # response = conn.patch("/api/v1/trips/#{trip_id}", trip: update_trip_params)
    # trip = JSON.parse(response.body, symbolize_names: true)
  end
end