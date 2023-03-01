class Trip
  attr_reader :trip_id, :name, :country, :city, :postcode, :place_id, :start_time, :end_time, :events, :image_url

  def initialize(info)
    @trip_id = info[:data][:id]
    @name = info[:data][:attributes][:name]
    @country = info[:data][:attributes][:country]
    @city = info[:data][:attributes][:city]
    @postcode = info[:data][:attributes][:postcode]
    @place_id = info[:data][:attributes][:place_id]
    @start_time = info[:data][:attributes][:start_time]
    @end_time = info[:data][:attributes][:end_time]
    @image_url = info[:data][:attributes][:image_url]
    @events = info[:included]
  end
end