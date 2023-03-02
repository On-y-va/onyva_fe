require 'rails_helper'

RSpec.describe 'flight index page', :vcr do
  before :each do
    visit trip_flights_path(3)
  end

  it 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end

  it 'contains a header Flight Information' do
    expect(page).to have_content("Flight Information")
  end

  it 'has a button to return to the trip show page' do
    within("#button") do
      expect(page).to have_button 'Trip Details'
    end
  end

  it 'has a button to return to the trip show page' do
    click_button 'Trip Details'
  end

  it 'has user email info' do
    within("#table") do
      expect(page).to have_content('email') #make dynamic
    end
  end

  it 'has flight Airline code info' do
    within("#table") do
      expect(page).to have_content('Airline Code') #make dynamic
    end
  end

  it 'has flight Flight number info' do
    within("#table") do
      expect(page).to have_content('Flight Number') #make dynamic
    end
  end

  it 'has flights flight date info' do
    within("#table") do
      expect(page).to have_content('2023-03-01T00:00:00.000Z') #make dynamic
    end
  end
end