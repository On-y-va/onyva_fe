require 'rails_helper'

RSpec.describe 'trips edit page', :vcr do
  it 'has a form to edit a trip' do
    visit edit_trip_path("1")

    expect(page).to have_field(:name)
    expect(page).to have_field(:country)
    expect(page).to have_field(:city)
    expect(page).to have_field(:postcode)
    expect(page).to have_field(:start_date)
    expect(page).to have_field(:end_date)
    expect(page).to have_button("Update")
  end

  xit 'redirects to the trip show page upon update' do
    visit edit_trip_path(1)

    fill_in(:name, with: "Trippin")
    fill_in(:country, with: "Mexico")
    fill_in(:city, with: "Cabo")
    fill_in(:postcode, with: "00123")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("Update")

    expect(current_path).to eq(trip_path(1))
    expect(page).to have_content('Trippin')
  end
end