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
  end
end