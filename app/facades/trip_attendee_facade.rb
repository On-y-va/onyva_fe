class TripAttendeeFacade
  def self.update_trip_attendee(user_id, trip_id)
    OnyvaService.update_trip_attendee(user_id, trip_id)
  end
    
  def self.delete_trip_attendee(user_id, trip_id)
    OnyvaService.update_trip_attendee(user_id, trip_id)
  end
end