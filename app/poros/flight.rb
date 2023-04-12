class Flight
  attr_reader :flight_id, :flight_number, :date, :user_name, :status

  def initialize(data)
    if data.present?
      @flight_id = data[:id]
      @flight_number = data[:attributes][:flight_number]
      @date = data[:attributes][:date]
      @status = data[:attributes][:status]
      @user_name = data[:attributes][:flight_user_name]
    end
  end
end