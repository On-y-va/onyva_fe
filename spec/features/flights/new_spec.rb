require 'rails_helper'

RSpec.describe 'flight index page', :vcr do
  before :each do
    visit new_trip_flight_path(2)
  end

  it 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']") #not sure this is accurate way to test
    end
  end

  it 'has a field to add email' do
    within("#email1") do
      expect(page).to have_field(:email)
      expect(page).to have_content('Email')
    end
  end

  it 'has a field to add date' do
    within("#date1") do
      expect(page).to have_field(:date)
    end
  end

  it 'has a field to add airline_code' do
    within("#airline_code1") do
      expect(page).to have_field(:airline_code)
    end
  end

  it 'has a field to add flight_number' do
    within("#flight_number1") do
      expect(page).to have_field(:flight_number)
    end
  end

  it 'has a button to add flight details' do
    expect(page).to have_button 'Add Flight'
  end

  xit 'can add the flight and details' do
    fill_in :email, with: 'test@gmail.com'
    fill_in :date, with: '03/01/2023' #think this should work
    fill_in :airline_code, with: 'SW'
    fill_in :flight_number, with: '123'

    click_on 'Add Flight'
    expect(current_path).to eq trip_flights

    expect(page).to have_content 'test@gmail.com'
    expect(page).to have_content '03/01/2023'
    expect(page).to have_content 'SW'
    expect(page).to have_content '123'
  end

  xit 'must include a valid email to add flight' do
    fill_in :email, with: ''
    fill_in :date, with: date.today #think this should work
    fill_in :airline_code, with: 'SW'
    fill_in :flight_number, with: '123'

    click_on 'Add Flight'
    expect(current_path).to eq new_trip_flight
    expect(page).to have_content #error message
  end
end