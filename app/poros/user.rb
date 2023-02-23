class User
  attr_reader :id, :first_name, :last_name, :phone_number, :email, :password, :emergency_contact_name, :emergency_contact_phone_number

  def initialize(data)
    @id = data[:id]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @phone_number = data[:phone_number]
    @email = data[:email]
    # @password = data[:password]
    @emergency_contact_name = data[:emergency_contact_name]
    @emergency_contact_phone_number = data[:emergency_contact_phone_number]
  end
end