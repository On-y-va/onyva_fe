require 'rails_helper'

RSpec.describe TripEvent do
  it 'exist and has attributes' do
    data = {
      id: '1',
      attributes: {
            name: 'Resturant',
            address: 'Location'
          }}

    trip_event = TripEvent.new(data)

    expect(trip_event).to be_a(TripEvent)
    expect(trip_event.name).to eq('Resturant')
    expect(trip_event.address).to eq('Location')
  end
end