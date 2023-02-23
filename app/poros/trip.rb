class Trip
  attr_reader :id, :name, :country, :city, :postcode, :place_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @country = data[:attributes][:country]
    @city = data[:attributes][:city]
    @postcode = data[:attributes][:postcode]
    @place_id = data[:attributes][:place_id]
  end
end