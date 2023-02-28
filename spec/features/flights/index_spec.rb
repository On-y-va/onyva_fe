require 'rails_helper'

RSpec.describe 'flight index page', :vcr do
  before :each do
    visit trip_flights
  end

  xit 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']") #not sure this is accurate way to test
  end

  xit 'contains a header Flight Information' do
    expect(page).to have_content("Flight Information")
  end

  xit 'has a button to return to the trip show page' do
    within("#button") do
      expect(page).to have_button 'Trip Details'
    end
  end

  xit 'has a button to return to the trip show page' do
    click_button 'Trip Details'
    expect(current_path).to eq trip_path(@trip_id)
  end

  xit 'has user email info' do
    within("#table") do
      expect(page).to have_content(@flights.email) #make dynamic
    end
  end

  xit 'has flight Airline code info' do
    within("#table") do
      expect(page).to have_content(@flights.airline_code) #make dynamic
    end
  end

  xit 'has flight Flight number info' do
    within("#table") do
      expect(page).to have_content(@flights.flight_number) #make dynamic
    end
  end

  xit 'has flights flight date info' do
    within("#table") do
      expect(page).to have_content(@flights.date) #make dynamic
    end
  end
end