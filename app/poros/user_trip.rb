class UserTrip
  attr_reader :trip_id, :name, :country, :city, :postcode, :start_time, :end_time, :image_url

  def initialize(info)
    @trip_id = info[:id]
    @name = info[:attributes][:name]
    @country = info[:attributes][:country]
    @city = info[:attributes][:city]
    @postcode = info[:attributes][:postcode]
    @start_time = info[:attributes][:start_time]
    @end_time = info[:attributes][:end_time]
    @image_url = info[:attributes][:image_url]
  end
end