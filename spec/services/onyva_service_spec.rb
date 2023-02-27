require 'rails_helper'

RSpec.describe OnyvaService do

  describe '#one_user' do
    it 'returns one user', :vcr do
      user = OnyvaService.one_user(1)

      expect(user).to have_key(:id)
      expect(user[:id]).to be_a(String)

      expect(user[:attributes]).to have_key(:first_name)
      expect(user[:attributes][:first_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:last_name)
      expect(user[:attributes][:last_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:phone_number)
      expect(user[:attributes][:phone_number]).to be_a(String)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:emergency_contact_name)
      expect(user[:attributes]).to have_key(:emergency_contact_phone_number)
    end
  end

  describe '#one_trip' do
    it 'returns one trip' do
      trip = OnyvaService.one_trip(1)

      expect(trip).to have_key(:id)
      expect(trip[:id]).to be_a(String)

      expect(trip[:attributes]).to have_key(:name)
      expect(trip[:attributes][:name]).to be_a(String)
      expect(trip[:attributes]).to have_key(:country)
      expect(trip[:attributes][:country]).to be_a(String)
      expect(trip[:attributes]).to have_key(:city)
      expect(trip[:attributes][:city]).to be_a(String)
      expect(trip[:attributes]).to have_key(:postcode)
      expect(trip[:attributes][:postcode]).to be_a(String)
      expect(trip[:attributes]).to have_key(:place_id)
    end
  end

  describe '#user_flights' do
    it 'returns a users flights' do
      flights = OnyvaService.flights(1)

      expect(flights).to be_a(Array)
      expect(flights[0]).to have_key(:id)
      expect(flights[0]).to have_key(:attributes)
      expect(flights[0][:attributes]).to have_key(:airline_code)
      expect(flights[0][:attributes]).to have_key(:flight_number)
      expect(flights[0][:attributes]).to have_key(:date)
    end
  end
end