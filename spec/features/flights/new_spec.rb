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

    within("div#email") do
      expect(page).to have_field(:email)
    end
  end

  it 'has a field to add date' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("div#date") do
      expect(page).to have_field(:date)
    end
  end

  it 'has a field to add flight_number' do
    click_on "Trippin"
    click_button "Add Flight Information"

    within("div#flight_number") do
      expect(page).to have_field(:flight_number)
    end
  end

  it 'has a button to add flight details' do
    click_on "Trippin"
    click_button "Add Flight Information"

    expect(page).to have_button 'ONYVA!'
  end

  it 'can add the flight and details' do
    click_on "Trippin"
    click_button "Add Flight Information"

    fill_in :email, with: 'john.doe@example.com'
    fill_in :date, with: '03/01/2023'
    fill_in :flight_number, with: 'N74GR'
    click_on 'ONYVA!'

    expect(current_path).to eq trip_flights_path(1)
    expect(page).to have_content("Flight successfully created")

    expect(page).to have_content 'John'
    expect(page).to have_content '2023-01-03'
    expect(page).to have_content 'N74GR'
  end

  it 'must include a valid email to add flight' do
    click_on "Trippin"
    click_button "Add Flight Information"

    fill_in :email, with: ''
    fill_in :date, with: '03/01/2023'
    fill_in :flight_number, with: '123'

    click_on 'ONYVA!'
    expect(current_path).to eq new_trip_flight_path(1)
    expect(page).to have_content("Flight could not be created")
  end

  it 'must include a valid date to add flight' do
    click_on "Trippin"
    click_button "Add Flight Information"

    fill_in :email, with: 'john.doe@example.com'
    fill_in :date, with: ''
    fill_in :flight_number, with: '123'

    click_on 'ONYVA!'
    expect(current_path).to eq new_trip_flight_path(1)
    expect(page).to have_content("Flight could not be created")
  end

  it 'must include a valid flight number to add flight' do
    click_on "Trippin"
    click_button "Add Flight Information"

    fill_in :email, with: 'john.doe@example.com'
    fill_in :date, with: '03/01/2023'
    fill_in :flight_number, with: '123'

    click_on 'ONYVA!'
    expect(current_path).to eq new_trip_flight_path(1)
    expect(page).to have_content("Flight could not be created")
  end
end