class OnyvaService

  def self.conn
    Faraday.new(url: "https://onyva-be.herokuapp.com")
    # Faraday.new(url: "http://localhost:5000")
  end

  def self.one_user(id)
    response = conn.get("/api/v1/users/#{id}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.delete_one_user(id)
    response = conn.delete("/api/v1/users/#{id}")
  end

  def self.delete_one_trip(id)
    response = conn.delete("/api/v1/trips/#{id}")
  end

  def self.one_trip(id)
    response = conn.get("/api/v1/trips/#{id}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.flights(id)
    response = conn.get("/api/v1/trips/#{id}/flights")
    require 'pry'; binding.pry
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.user_trips(id, status)
    response = conn.get("/api/v1/users/#{id}/trips/find_all?status=#{status}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.trip_events(id)
    response = conn.get("/api/v1/trips/#{id}/trip_events")
    # response = conn.get("/api/v1/trips/#{id}/trip_events/find_all?type=#{type}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end
end