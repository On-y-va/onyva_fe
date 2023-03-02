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
    require 'pry'; binding.pry
    results.map do |user|
      User.new(user)
    end
  end
end