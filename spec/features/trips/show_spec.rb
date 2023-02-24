require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  before :each do
    visit trip_path(1)
  end

  it 'displays the trips name' do
    expect(page).to have_content('guys trip')
  end

  it 'has a section for Group packing list' do
    expect(page).to have_content('Group Packing list')
  end

  it 'has a section for places to eat' do
    expect(page).to have_content('Places to eat')
  end

  it 'has a section for Things to do' do
    expect(page).to have_content('Things to do')
  end

  it 'has a section for Todays Itinerary' do
    expect(page).to have_content('Todays Itinerary')
  end
end