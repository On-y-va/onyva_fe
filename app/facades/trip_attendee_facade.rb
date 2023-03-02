class TripAttendeeFacade
  def update_trip_attendee(user_id, trip_id)
    OnyvaService.update_trip_attendee(user_id, trip_id)
  end
end