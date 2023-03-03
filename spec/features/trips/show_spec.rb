require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has the onyva logo' do
    click_on "Trippin"

    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end
  
  it 'has a button to view the trips flight information' do
    click_on "Trippin"
    
    within("#button") do
      expect(page).to have_button 'Flight Information'
    end

    click_button 'Flight Information'
    expect(current_path).to eq trip_flights_path(1)
  end

  it 'has a button to add your flight information' do
    click_on "Trippin"
    
    within("#button") do
      expect(page).to have_button 'Add Flight Information'
    end

    click_button 'Add Flight Information'
    expect(current_path).to eq new_trip_flight_path(1)
  end

  it 'has a button to update the trip' do
    click_on "Trippin"
    
    within("#button") do
      expect(page).to have_button 'Update Trip'
    end

    click_button 'Update Trip'
    expect(current_path).to eq edit_trip_path(1)
  end

  it 'has a button to My Home Page' do
    click_on "Trippin"
    
    within("#button") do
      expect(page).to have_button 'My Home Page'
    end

    click_button 'My Home Page'
    expect(current_path).to eq user_path(1)
  end

  it 'has a button to delete a trip' do
    click_on "Trippin"

    expect(page).to have_button "Delete Trippin"
  end

  it 'displays the trips name' do
    click_on "Trippin"
    
    expect(page).to have_content("Trippin")
  end

  it 'displays a picture from the location of the trip' do
    click_on "Trippin"
    
    within('#pic') do
      expect(page).to have_css("img[src*='https://live.staticflickr.com/65535/51328655264_19b4724735_w.jpg']")
    end    
  end

  it 'has a section for places to eat and list the name and address' do
    click_on "Trippin"
    
    within("#food") do
      expect(page).to have_content('Places to eat')
    end
  end

  it 'has a section for Things to do' do
    click_on "Trippin"
    
    within("#sights") do
      expect(page).to have_content('Things to do')
    end
  end

  it 'has a section for Todays Itinerary' do
    click_on "Trippin"
    
    within("#schedule") do
      expect(page).to have_content('Todays Itinerary')
    end
  end

  it 'has a button to invite friends' do
    click_on "Trippin"
    click_on "Invite Friends"
    
    fill_in(:user_emails, with: "judy.doe@example.com")
    click_on "Invite"

    expect(current_path).to eq(trip_path(1))
  end
end