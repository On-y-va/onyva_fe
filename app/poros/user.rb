class User
  attr_reader :id, :first_name, :last_name, :phone_number, :email, :password, :emergency_contact_name, :emergency_contact_phone_number, :google_uid

  def initialize(data)
    # TODO: guard statemant instead of conditional
    if data.present?
      @id = data[:id]
      @first_name = data[:attributes][:first_name]
      @last_name = data[:attributes][:last_name]
      @phone_number = data[:attributes][:phone_number]
      @email = data[:attributes][:email]
      @emergency_contact_name = data[:attributes][:emergency_contact_name]
      @emergency_contact_phone_number = data[:attributes][:emergency_contact_phone_number]
    else
      require 'pry'; binding.pry
    end
  end
end