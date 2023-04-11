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
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:emergency_contact_name)
      expect(user[:attributes]).to have_key(:emergency_contact_phone_number)
    end
  end

  describe '#delete_one_user' do
    it 'deletes one user' do      
      response = OnyvaService.delete_one_user(2)

      expect(response.status).to eq 204
      expect(response.body).to eq("")
    end
  end

  describe '#one_trip' do
    it 'returns one trip' do
      trip = OnyvaService.one_trip(2)

      expect(trip).to be_a(Hash)
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
      expect(trip[:attributes]).to have_key(:start_date)
      expect(trip[:attributes]).to have_key(:end_date)
    end
  end

  describe '#delete_one_trip' do
    xit 'deletes one trip' do      
      response = OnyvaService.delete_one_trip(2)
      response = JSON.parse(response.body, symbolize_names: true)
      expect(response.body).to eq("")
      expect(response.status).to eq(204)
    end
  end

  describe '#user_flights' do
    it 'returns a users flights' do
      flights = OnyvaService.flights(3)

      expect(flights).to be_a(Array)
      expect(flights[0]).to have_key(:id)
      expect(flights[0]).to have_key(:attributes)
      expect(flights[0][:attributes]).to have_key(:flight_number)
      expect(flights[0][:attributes]).to have_key(:date)
    end
  end

  describe '#user_trips' do
    it 'returns a users trips' do      
      user_trip = OnyvaService.user_trips(1, 1)

      expect(user_trip).to be_a(Array)
    end
  end

  describe '#find_user_by_google_uid' do
    it 'returns a users' do      
      user = OnyvaService.find_user_by_google_uid("1235456789")
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

  describe '#update_user' do 
    it 'updates a user' do      
      user_params = { phone_number: "1234456778" }
      user = OnyvaService.update_user(1, user_params)

      expect(user[:attributes]).to have_key(:phone_number)
      expect(user[:attributes][:phone_number]).to eq("1234456778")
    end
  end

  describe '#create_trip' do
    it 'creates a trip' do
      trip = {
                name: "Bachelor's Trip",
                country: "United States",
                city: "Murfreesboro",
                postcode: "37128",
                start_date: "12/12/23",
                end_date: "12/13/23",
                user_id: 1
              }
      
      trip = OnyvaService.create_trip(trip)

      expect(trip).to be_a(Hash)
      expect(trip).to have_key(:id)
      expect(trip[:id]).to be_a(String)
      expect(trip[:attributes]).to have_key(:name)
      expect(trip[:attributes][:name]).to be_a(String)
      expect(trip[:attributes]).to have_key(:city)
      expect(trip[:attributes][:city]).to be_a(String)
      expect(trip[:attributes]).to have_key(:country)
      expect(trip[:attributes][:country]).to be_a(String)
      expect(trip[:attributes]).to have_key(:postcode)
      expect(trip[:attributes][:postcode]).to be_a(String)
      expect(trip[:attributes]).to have_key(:end_date)
      expect(trip[:attributes][:end_date]).to be_a(String)
      expect(trip[:attributes]).to have_key(:start_date)
      expect(trip[:attributes][:start_date]).to be_a(String)
      expect(trip[:attributes]).to have_key(:events)
      expect(trip[:attributes][:events]).to be_a(Array)
    end

    describe "#create_flight" do
      xit 'creates a flight' do
        flight_params = {
                  airline_code: "SW",
                  flight_number: "1234",
                  date: "12/12/23",
                  user_id: 1
                }
        
        flight = OnyvaService.create_flight(1, flight_params)

        expect(flight).to be_a(Hash)
        expect(flight).to have_key(:flight_id)
        expect(flight[:id]).to be_a(String)
        expect(flight[:attributes]).to have_key(:airline_code)
        expect(flight[:attributes][:airline_code]).to be_a(String)
        expect(flight[:attributes]).to have_key(:flight_number)
        expect(flight[:attributes][:flight_number]).to be_a(String)
        expect(flight[:attributes]).to have_key(:date)
        expect(flight[:attributes][:date]).to be_a(String)
      end
    end

    describe "#update_trip_attendee" do
      xit 'update a trip attendee' do
        trip_attendee_params = {
                                user_id: 1,
                                trip_id: 2,
                                status: 1
                              }
        
        trip_attendee = OnyvaService.update_trip_attendee(1, 1)

        expect(trip_attendee.status).to eq("accept")
      end
    end

    describe '#delete_trip_attendee' do
      xit 'deletes a trip attendee' do      
        response = OnyvaService.delete_trip_attendee(2)
        response = JSON.parse(response.body, symbolize_names: true)
        expect(response.body).to eq("")
        expect(response.status).to eq(204)
      end
    end
  end
end
