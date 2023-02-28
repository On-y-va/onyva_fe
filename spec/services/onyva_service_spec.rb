require 'rails_helper'

RSpec.describe OnyvaService, :vcr do

  describe '#one_user' do
    it 'returns one user' do      
      user = OnyvaService.one_user(2)

      expect(user).to be_a(Hash)
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

  describe '#delete_one_user' do
    it 'deletes one user' do      
      user = OnyvaService.delete_one_user(2)

      expect(user[:response_body]).to eq nil
    end
  end

  describe '#one_trip' do
    it 'returns one trip' do
      trip = OnyvaService.one_trip(2)

      expect(trip).to be_a(Hash)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:name)
      expect(trip[:data][:attributes][:name]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:country)
      expect(trip[:data][:attributes][:country]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:city)
      expect(trip[:data][:attributes][:city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:postcode)
      expect(trip[:data][:attributes][:postcode]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:place_id)
      expect(trip[:data][:attributes]).to have_key(:start_date)
      expect(trip[:data][:attributes]).to have_key(:end_date)
    end
  end

  xdescribe '#user_flights' do
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