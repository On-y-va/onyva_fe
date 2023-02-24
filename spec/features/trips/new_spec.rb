require 'rails_helper'

RSpec.describe 'trips new page', :vcr do
  it 'has a form to create a new trip' do
    visit new_trip_path

    expect(page).to have_field(:name)
    expect(page).to have_field(:country)
    expect(page).to have_field(:city)
    expect(page).to have_field(:postcode)
    expect(page).to have_field(:start_date)
    expect(page).to have_field(:end_date)
    expect(page).to have_button("Onyva")
  end

  it 'redirects to the trip show page upon successful registration' do
    visit new_trip_path

    fill_in(:name, with: "Trippin")
    fill_in(:country, with: "Mexico")
    fill_in(:city, with: "Cabo")
    fill_in(:postcode, with: "00123")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("Onyva")

    expect(page).to have_css(".trip_name")
  end
end