class OnyvaService

  def self.conn
    Faraday.new(url: "https://onyva-be.herokuapp.com")
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
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.user_trips(id, status)
    response = conn.get("/api/v1/users/#{id}/trips/find_all?status=#{status}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.find_user_by_email(user_email)
    response = conn.get("https://onyva-be.herokuapp.com/api/v1/users/find", email: user_email)
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end
end