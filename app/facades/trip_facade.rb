class TripFacade
  def self.one_trip(id)
    result = OnyvaService.one_trip(id)
    trip = Trip.new(result)
  end

  def self.create_trip(trip)
    result = OnyvaService.create_trip(trip)
    Trip.new(result)
  end
end