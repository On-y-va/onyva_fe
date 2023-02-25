require 'rails_helper'

RSpec.describe FlightsFacade do
  it 'returns a flights poro', :vcr do
   flights = FlightsFacade.flights(1)

   expect(flights[0]).to be_a(Flight)
   expect(flights[1]).to be_a(Flight)
  end
end