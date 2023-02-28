require 'rails_helper'

RSpec.describe 'trips new page', :vcr do
  xit 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']") #not sure this is accurate way to test
    end
  end

  it 'has a form to create a new trip' do
    visit new_trip_path

    within('#formline1') do
      expect(page).to have_field(:name)
      expect(page).to have_field(:country)
    end

    within('#formline2') do
      expect(page).to have_field(:city)
      expect(page).to have_field(:postcode)
    end

    within('#formline3') do
      expect(page).to have_field(:start_date)
      expect(page).to have_field(:end_date)
    end

    expect(page).to have_button("Onyva")
  end

  xit 'redirects to the trip show page upon successful registration' do
    visit new_trip_path

    fill_in(:name, with: "Trippin")
    fill_in(:country, with: "Mexico")
    fill_in(:city, with: "Cabo")
    fill_in(:postcode, with: "00123")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("Onyva")

    expect(current_path).to eq trip_path(1)
    expect(page).to have_css(".trip_name")
  end

  xit 'doesnt create a trip if country is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: ""
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: "00123"
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("Onyva")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  xit 'doesnt create a trip if city is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: ""
    fill_in :postcode, with: "00123"
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("Onyva")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  xit 'doesnt create a trip if postcode is missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: ""
    fill_in :start_date, with: "2023-02-28"
    fill_in :end_date, with: "2023-03-09"

    click_button("Onyva")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end

  xit 'doesnt create a trip if dates are missing' do
    visit new_trip_path

    fill_in :name, with: "Trippin"
    fill_in :country, with: "Mexico"
    fill_in :city, with: "Cabo"
    fill_in :postcode, with: "1234"
    fill_in :start_date, with: ""
    fill_in :end_date, with: ""

    click_button("Onyva")

    expect(current_path).to eq new_trip_path
    # expect(page).to have_content(#error message)
  end
end