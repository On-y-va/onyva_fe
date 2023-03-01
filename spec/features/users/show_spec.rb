require 'rails_helper'

RSpec.describe 'user show page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'displays the users name' do
    visit user_path(1)
    expect(page).to have_content('John Doe')
  end

  it 'has a button to create a trip' do
    visit user_path(1)
    expect(page).to have_button('Create Trip')
  end

  it 'has a button to edit profile' do
    visit user_path(1)
    expect(page).to have_button('Edit Profile')
  end

  it 'has a button to go to my trips' do
    visit user_path(1)
    expect(page).to have_button('My Trips')
  end

  it 'has a section for upcoming trips' do
    visit user_path(1)
    expect(page).to have_content('Upcoming Trips')
  end

  it 'has a section for pending trips' do
    visit user_path(1)
    expect(page).to have_content('Pending Trips')
  end
end