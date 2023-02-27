class TripEventFacade
  def self.trip_events(id)
    results = OnyvaService.trip_events(id)
    results.map do |trip_event|
       TripEvent.new(trip_event)
    end
  end
end