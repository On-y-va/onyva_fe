class TripFacade
  def self.one_trip(id)
    result = OnyvaService.one_trip(id)
    trip = Trip.new(result)
  end

  def self.create_trip(trip)
    result = OnyvaService.create_trip(trip)
    Trip.new(result)
  end

  def self.trip_users(id)
    results = OnyvaService.trip_users(id)
    results.map do |user|
      User.new(user)
    end
  end

  def self.update_trip(trip_id, update_trip_params)
    result = OnyvaService.update_trip(trip_id, update_trip_params)
  end

  def self.destroy_trip(trip_id)
    OnyvaService.destroy_trip(trip_id)
  end
end