require 'rails_helper'

RSpec.describe FlightFacade do
  it 'returns a flights poro', :vcr do
   flights = FlightFacade.flights(1)
require 'pry'; binding.pry
   expect(flights).to be_a(Array)
   expect(flights[0]).to be_a(Flight)
   expect(flights[1]).to be_a(Flight)
  end
end