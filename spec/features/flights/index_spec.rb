require 'rails_helper'

RSpec.describe 'flight index page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has the onyva logo' do
    click_on "Trippin"
    click_button "Flight Information"

    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end

  it 'contains a header Flight Information' do
    click_on "Trippin"
    click_button "Flight Information"

    expect(page).to have_content("Group Flight Information")
  end

  it 'has a button to return to the trip show page' do
    click_on "Trippin"
    click_button "Flight Information"

    expect(page).to have_button 'Trip Details'
  end

  it 'has user email info' do
    click_on "Trippin"
    click_button "Flight Information"

    within("#table") do
      expect(page).to have_content('Name')
    end
  end

  it 'has flight Flight number info' do
    click_on "Trippin"
    click_button "Flight Information"

    within("#table") do
      expect(page).to have_content('Flight Number')
    end
  end

  it 'has flights flight date info' do
    click_on "Trippin"
    click_button "Flight Information"

    within("#table") do
      expect(page).to have_content('Date')
    end
  end
end