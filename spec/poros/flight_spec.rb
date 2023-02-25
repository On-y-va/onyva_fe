require 'rails_helper'

RSpec.describe Flight do
  it 'exist and has attributes' do
    data = {
      id: '1',
      attributes: {
            airline_code: 'SW',
            flight_number: 'fv3e',
            date: Date.today
          }}

    flight = Flight.new(data)

    expect(flight).to be_a(Flight)
    expect(flight.flight_id).to eq("1")
    expect(flight.airline_code).to eq("SW")
    expect(flight.flight_number).to eq("fv3e")
    expect(flight.date).to eq(Date.today)
  end
end