require 'rails_helper'

RSpec.describe 'user show page', :vcr do
  before :each do
    visit "/auth/google_oauth2"
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    
    visit root_path
    click_button "Continue with Google"
  end

  it 'displays the users name' do
    expect(page).to have_content('John Doe')
  end

  it 'has a button to create a trip' do
    click_button 'Create Trip'

    expect(current_path).to eq(new_trip_path) 
  end

  xit 'has a button to edit profile' do
    click_button 'Edit Profile'
    
    expect(current_path).to eq(edit_user_path(1))
  end

  it 'has a section for upcoming trips' do
    expect(page).to have_content('Upcoming Trips')
  end

  it 'has a section for pending trips' do
    expect(page).to have_content('Pending Trips')
  end
end