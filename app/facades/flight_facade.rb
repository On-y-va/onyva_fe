class FlightFacade
  def self.flights(id)
    results = OnyvaService.flights(id)
    results.map { |flight| Flight.new(flight) }
  end

  def self.create_flight(trip_id, flight)
    OnyvaService.create_flight(trip_id, flight)
  end
end