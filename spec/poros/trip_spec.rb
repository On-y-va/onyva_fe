require 'rails_helper'

RSpec.describe Trip do
  it 'exist and has attributes' do
    data = {
      id: '1',
      attributes: {
            name: 'Guys trip',
            country: 'Italy',
            city: 'Rome',
            postcode: '00140',
            place_id: nil,
            start_time: "2023-02-28",
            end_time: "2023-03-09"
          }}

    trip = Trip.new(data)

    expect(trip).to be_a(Trip)
    expect(trip.id).to eq("1")
    expect(trip.name).to eq("Guys trip")
    expect(trip.country).to eq("Italy")
    expect(trip.city).to eq("Rome")
    expect(trip.postcode).to eq("00140")
    expect(trip.place_id).to eq(nil)
    expect(trip.start_time).to eq("2023-02-28")
    expect(trip.end_time).to eq("2023-03-09")
  end
end