class OnyvaService

  def self.conn
    Faraday.new(url: "http://localhost:5000")
  end

  def self.one_user(id)
    response = conn.get("/api/v1/users/#{id}")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

end