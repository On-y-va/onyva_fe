require 'rails_helper'

RSpec.describe TripFacade do
  it 'returns a trip poro', :vcr do
   trip = TripFacade.one_trip(17)
   expect(trip).to be_a(Trip)
  end
  
  it 'returns a newly created trip poro', :vcr do
    trip = {
      name: "Bachelor's Trip",
      country: "United States",
      city: "Murfreesboro",
      postcode: "37128",
      start_date: "12/12/23",
      end_date: "12/12/23",
      user_id: 2
    }
    
    trip = TripFacade.create_trip(trip)
    
    expect(trip).to be_a(Trip)
  end
end