class Trip
  attr_reader :trip_id, :name, :country, :city, :postcode, :place_id, :start_time, :end_time, :events, :image_url

  def initialize(info)
    if info.present?
      @trip_id = info[:id]
      @name = info[:attributes][:name]
      @country = info[:attributes][:country]
      @city = info[:attributes][:city]
      @postcode = info[:attributes][:postcode]
      @place_id = info[:attributes][:place_id]
      @start_time = info[:attributes][:start_time]
      @end_time = info[:attributes][:end_time]
      @image_url = info[:attributes][:image_url]
      @events = info[:attributes][:events]
    end
  end
end