require 'rails_helper'

RSpec.describe UserTrip do
  it 'exist and has attributes' do
  data = {
          id: '1',
          attributes: {
                name: 'Guys trip',
                country: 'Italy',
                city: 'Rome',
                postcode: '00140',
                start_time: "2023-02-28",
                end_time: "2023-03-09"
          }
        }

    user_trip = UserTrip.new(data)
    
    expect(user_trip).to be_a(UserTrip)
    expect(user_trip.trip_id).to eq("1")
    expect(user_trip.name).to eq("Guys trip")
    expect(user_trip.country).to eq("Italy")
    expect(user_trip.city).to eq("Rome")
    expect(user_trip.postcode).to eq("00140")
    expect(user_trip.start_time).to eq("2023-02-28")
    expect(user_trip.end_time).to eq("2023-03-09")
  end
end