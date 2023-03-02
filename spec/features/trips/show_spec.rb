require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has the onyva logo' do
    visit trip_path(3)
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end
  
  it 'has a button to view the trips flight information' do
    visit trip_path(3)
    within("#button") do
      expect(page).to have_button 'Flight Information'
    end

    click_button 'Flight Information'
    # expect(current_path).to eq trip_flights_path(@trip.trip_id)
  end

  it 'has a button to add your flight information' do
    visit trip_path(3)
    within("#button") do
      expect(page).to have_button 'Add Flight Information'
    end

    click_button 'Add Flight Information'
    # expect(current_path).to eq new_trip_flight_path(@trip.trip_id)
  end

  it 'has a button to update the trip' do
    visit trip_path(3)
    within("#button") do
      expect(page).to have_button 'Update Trip'
    end

    click_button 'Update Trip'
    # expect(current_path).to eq edit_trip_path(@trip.trip_id)
  end

  it 'deletes the trip' do
    visit new_trip_path

    fill_in "Name", with: "Trippin"
    fill_in(:country, with: "Mexico")
    fill_in(:city, with: "Cabo")
    fill_in(:postcode, with: "00123")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("ONYVA!")

    trip_show_uri = current_path
    click_button "Delete Trippin"
    # expect(page).to have_content 'Trip succesfully deleted'

    expect(current_path[1..-1].partition("/")[0]).to eq("users")
    current_path[1..-1].partition("/").last.each_char do |char|
      expect(char.to_i.to_s).to eq(char)
    end
  end

  it 'displays the trips name' do
    visit trip_path(3)
    expect(page).to have_content("Stag Do") #not reconising @trip.name
  end

  xit 'displays a picture from the location of the trip' do
    visit trip_path(3)
    within('#pic') do
      expect(page).to have_css(img[src*="#{@trip.image_url}"])
    end    
  end

  it 'has a section for places to eat and list the name and address' do
    visit trip_path(3)
    within("#food") do
      expect(page).to have_content('Places to eat')
    end
  end

  it 'has a section for Things to do' do
    visit trip_path(3)
    within("#sights") do
      expect(page).to have_content('Things to do')
    end
  end

  it 'has a section for Todays Itinerary' do
    visit trip_path(3)
    within("#schedule") do
      expect(page).to have_content('Todays Itinerary')
    end
  end
end