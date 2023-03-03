require 'rails_helper'

RSpec.describe 'flight index page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has the onyva logo' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']") #not sure this is accurate way to test
    end
  end

  it 'has a field to add email' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("#email1") do
      expect(page).to have_field(:email)
      expect(page).to have_content('Email')
    end
  end

  it 'has a field to add date' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("#date1") do
      expect(page).to have_field(:date)
    end
  end

  it 'has a field to add airline_code' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("#airline_code1") do
      expect(page).to have_field(:airline_code)
    end
  end

  it 'has a field to add flight_number' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("#flight_number1") do
      expect(page).to have_field(:flight_number)
    end
  end

  it 'has a button to add flight details' do
    click_on "Trippin"
    click_button "Add Flight Information"

    expect(page).to have_button 'Add Flight'
  end

  xit 'can add the flight and details' do
    click_on "Trippin"
    click_button "Add Flight Information"

    fill_in :email, with: 'test@gmail.com'
    fill_in :date, with: '03/01/2023'
    fill_in :airline_code, with: 'SW'
    fill_in :flight_number, with: '500'

    click_on 'Add Flight'
    expect(current_path).to eq trip_flights_path(1)

    expect(page).to have_content 'test@gmail.com'
    expect(page).to have_content '03/01/2023'
    expect(page).to have_content 'SW'
    expect(page).to have_content '500'
  end

  xit 'must include a valid email to add flight' do
    fill_in :email, with: ''
    fill_in :date, with: date.today
    fill_in :airline_code, with: 'SW'
    fill_in :flight_number, with: '123'

    click_on 'Add Flight'
    expect(current_path).to eq new_trip_flight
    expect(page).to have_content #error message
  end
end