require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  before :each do
    visit trip_path(1)
  end

  xit 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end
  
  it 'has a button to view the trips flight information' do
    within("#button") do
      expect(page).to have_button 'Flight Information'
    end

    click_button 'Flight Information'
    # expect(current_path).to eq trip_flights_path(@trip.trip_id)
  end

  it 'has a button to add your flight information' do
    within("#button") do
      expect(page).to have_button 'Add Flight Information'
    end

    click_button 'Add Flight Information'
    # expect(current_path).to eq new_trip_flight_path(@trip.trip_id)
  end

  it 'has a button to update the trip' do
    within("#button") do
      expect(page).to have_button 'Update Trip'
    end

    click_button 'Update Trip'
    # expect(current_path).to eq edit_trip_path(@trip.trip_id)
  end

  xit 'has a button to delete the trip' do
    within("#button") do
      expect(page).to have_button "Delete #{@trip.name}" #not reconising @trip.name
    end

    click_button "Delete #{@trip.name}"
    expect(current_path).to eq trip_path(@trip.trip_id) #should this go somewhere else? the trip and id should no longer exist?
    # expect(page).to have_content 'Trip succesfully deleted'
  end

  xit 'displays the trips name' do
    expect(page).to have_content("#{@trip.name}")
  end

  xit 'displays a picture from the location of the trip' do
    within('#pic') do
      expect(page).to have_css(img[src*="#{@trip.image_url}"])
    end    
  end

  it 'has a section for places to eat and list the name and address' do
    within("#food") do
      expect(page).to have_content('Places to eat')
      # expect(page).to have_content(restuarant[0][:attributes][:name])
      # expect(page).to have_content(restuarant[0][:attributes][:address])
    end
  end

  it 'has a section for Things to do' do
    within("#sights") do
      expect(page).to have_content('Things to do')
    end
  end

  it 'has a section for Todays Itinerary' do
    within("#schedule") do
      expect(page).to have_content('Todays Itinerary')
    end
  end

  it 'has a section for Group packing list' do #think this is extension and back burner?
    expect(page).to have_content('Group Packing list')
  end
end