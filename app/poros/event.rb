class Event
  attr_reader :name, :address

  def initialize(data)
    @name = data[:attributes][:name]
    @address = data[:attributes][:address]
  end
end