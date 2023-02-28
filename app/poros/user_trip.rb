class UserTrip
  attr_reader :trip_id, :name, :country, :city, :postcode, :start_date, :end_date, :image_url

  def initialize(info)
    @trip_id = info[:id]
    @name = info[:attributes][:name]
    @country = info[:attributes][:country]
    @city = info[:attributes][:city]
    @postcode = info[:attributes][:postcode]
    @start_date= info[:attributes][:start_date]
    @end_date = info[:attributes][:end_date]
    @image_url = info[:attributes][:image_url]
  end
end