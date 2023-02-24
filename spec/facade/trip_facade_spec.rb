require 'rails_helper'

RSpec.describe TripFacade do
  it 'returns a trip poro', :vcr do
   trip = TripFacade.one_trip(1)
   
   expect(trip).to be_a(Trip)
  end
end