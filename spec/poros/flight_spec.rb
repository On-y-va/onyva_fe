require 'rails_helper'

RSpec.describe Flight do
  it 'exist and has attributes' do
    data = {
      id: '1',
      attributes: {
            flight_number: 'SWfv3e',
            date: Date.today,
            status: "Expected",
            flight_user_name: "Braxton"
          }}

    flight = Flight.new(data)

    expect(flight).to be_a(Flight)
    expect(flight.flight_id).to eq("1")
    expect(flight.flight_number).to eq("SWfv3e")
    expect(flight.date).to eq(Date.today)
    expect(flight.status).to eq("Expected")
    expect(flight.user_name).to eq("Braxton")
  end
end