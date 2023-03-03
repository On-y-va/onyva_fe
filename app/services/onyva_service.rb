class OnyvaService
  def self.conn
    # Faraday.new(url: "https://onyva-be.herokuapp.com")
    Faraday.new(url: "http://localhost:5000")
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

  def self.flights(trip_id)
    response = conn.get("/api/v1/trips/#{trip_id}/flights")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.user_trips(id, status)
    response = conn.get("/api/v1/users/#{id}/trips/find_all?status=#{status}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.find_user_by_google_uid(google_uid)
    response = conn.get("/api/v1/users/find", google_uid: google_uid)
    return JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.update_user(id, update_params)
    response = conn.patch("/api/v1/users/#{id}", {user: update_params})
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.create_user(user)
    response = conn.post("/api/v1/users", user: user)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.create_trip(trip)
    response = conn.post("/api/v1/trips", trip: trip)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.destroy_trip(trip_id)
    response = conn.delete("api/v1/trips/#{trip_id}")
  end
  
  def self.create_flight(trip_id, flight)
    response = conn.post("/api/v1/trips/#{trip_id}/flights", flight: flight)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_trip_attendee(user_id, trip_id)
    conn.patch("/api/v1/users/#{user_id}/trips/#{trip_id}")
  end

  def self.delete_trip_attendee(user_id, trip_id)
    conn.delete("/api/v1/users/#{user_id}/trips/#{trip_id}")
  end

  def self.create_trip_attendees(trip_id, user_emails)
    conn.post("/api/v1/trips/#{trip_id}/trip_attendees", user_emails: user_emails)
  end

  def self.trip_users(trip_id)
    response = conn.get("/api/v1/trips/#{trip_id}/users")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end
end