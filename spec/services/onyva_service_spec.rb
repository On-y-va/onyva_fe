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

  describe '#delete_one_trip' do
    it 'deletes one trip' do      
      response = OnyvaService.delete_one_trip(2)

      response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_key(:data)
      expect(response.status).to eq(204)
    end
  end

  describe '#user_flights' do
    it 'returns a users flights' do
      flights = OnyvaService.flights(3)

      expect(flights).to be_a(Array)
      expect(flights[0]).to have_key(:id)
      expect(flights[0]).to have_key(:attributes)
      expect(flights[0][:attributes]).to have_key(:airline_code)
      expect(flights[0][:attributes]).to have_key(:flight_number)
      expect(flights[0][:attributes]).to have_key(:date)
    end
  end

  xdescribe '#user_trips' do
    it 'returns a users trips' do      
      user_trip = OnyvaService.user_trips(3, 'accepted')

      expect(user_trip).to be_a(Hash)
    end
  end

  describe '#find_user_by_google_uid' do
    it 'returns a users' do      
      user = OnyvaService.find_user_by_google_uid(113236883765066486494)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:id)
      expect(user[:id]).to be_a(String)
      expect(user[:attributes]).to have_key(:first_name)
      expect(user[:attributes][:first_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:last_name)
      expect(user[:attributes][:last_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:phone_number)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:emergency_contact_name)
      expect(user[:attributes]).to have_key(:emergency_contact_phone_number)
    end
  end

  xdescribe '#update_user' do #this wont run as it doesnt know what update params are in onyva_service/controller
    it 'updates a user' do      
      user = OnyvaService.update_user(3)

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
end
