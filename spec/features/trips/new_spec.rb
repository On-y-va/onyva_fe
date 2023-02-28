require 'rails_helper'

RSpec.describe 'trips new page' do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  
  it 'has the onyva logo' do
    visit new_trip_path

    within('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end

  it 'has a form to create a new trip' do
    visit new_trip_path

    within('#formline1') do
      expect(page).to have_field(:name)
      expect(page).to have_field(:city)
    end

    within('#formline2') do
      expect(page).to have_field(:country)
      expect(page).to have_field(:postcode)
    end

    within('#formline3') do
      expect(page).to have_field(:start_date)
      expect(page).to have_field(:end_date)
    end

    expect(page).to have_button("ONYVA!")
  end

  it 'redirects to the trip show page upon successful registration' do
    visit new_trip_path

    fill_in "Name", with: "Trippin"
    fill_in(:country, with: "Mexico")
    fill_in(:city, with: "Cabo")
    fill_in(:postcode, with: "00123")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("ONYVA!")

    # expect(current_path).to eq trip_path(59)
    # expect(current_path).to eq trip_path(user[:id])
    # expect(page).to have_css(".trip_name")
  end

  it 'doesnt create a trip if country is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: ""
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: "00123"
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("ONYVA!")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  it 'doesnt create a trip if city is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: ""
    fill_in :postcode, with: "00123"
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("ONYVA!")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  it 'doesnt create a trip if postcode is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: ""
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("ONYVA!")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  it 'doesnt create a trip if dates are missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: "1234"
    fill_in :start_date, with: ""
    fill_in :end_date, with: ""

    click_button("ONYVA!")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end
end