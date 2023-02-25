class Flight
  attr_reader :flight_id, :airline_code, :flight_number, :date

  def initialize(data)
    @flight_id = data[:id]
    @airline_code = data[:attributes][:airline_code]
    @flight_number = data[:attributes][:flight_number]
    @date = data[:attributes][:date]
  end
end