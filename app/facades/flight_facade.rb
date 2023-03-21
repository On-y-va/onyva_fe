class FlightFacade
  def self.flights(trip_id)
    results = OnyvaService.flights(trip_id)
    results.map { |flight| Flight.new(flight) }
  end

  def self.one_flight(trip_id, flight_id)
    result = OnyvaService.one_flight(trip_id, flight_id)
    Flight.new(result)
  end

  def self.create_flight(trip_id, flight)
    result = OnyvaService.create_flight(trip_id, flight)
    Flight.new(result) unless result.nil?
  end

  def self.delete_flight(trip_id, flight_id)
    result = OnyvaService.delete_flight(trip_id, flight_id)
  end

  def self.update_flight(trip_id, flight_id, flight)
    result = OnyvaService.update_flight(trip_id, flight_id, flight)
  end
end