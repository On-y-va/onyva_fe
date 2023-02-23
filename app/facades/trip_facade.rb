class TripFacade

  def self.one_trip(id)
    result = OnyvaService.one_trip(id)
    trip = Trip.new(result)
  end
end