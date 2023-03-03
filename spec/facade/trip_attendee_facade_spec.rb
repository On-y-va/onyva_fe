require 'rails_helper'

RSpec.describe TripAttendeeFacade do
  xit 'returns a trip attendee poro' do
   trip = TripFacade.one_trip(17)
   expect(trip).to be_a(Trip)
  end
  
  xit 'returns a newly created trip poro' do
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