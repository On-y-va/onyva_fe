class TripAttendeeFacade
  def self.update_trip_attendee(user_id, trip_id)
    OnyvaService.update_trip_attendee(user_id, trip_id)
  end
    
  def self.delete_trip_attendee(user_id, trip_id)
    OnyvaService.delete_trip_attendee(user_id, trip_id)
  end

  def self.create_trip_attendees(trip_id, user_emails)
    OnyvaService.create_trip_attendees(trip_id, user_emails)
  end
end