class FlightsFacade
  def self.flights(id)
    results = OnyvaService.flights(id)
    results.map do |flight|
       Flight.new(flight)
    end
  end
end