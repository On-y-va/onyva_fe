class EventFacade
  def self.update_event(trip_id, event_id)
    reslt = OnyvaService.update_event(trip_id, event_id)
  end
end