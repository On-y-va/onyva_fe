require 'rails_helper'

RSpec.describe 'trips edit page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has the onyva logo' do
    click_on "Trippin"
    click_button "Update Trip"

    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end

  it 'has a form to edit a trip' do
    click_on "Trippin"
    click_button "Update Trip"

    within('#formline1') do
      expect(page).to have_field(:name)
    end
    
    within('#formline2') do
      expect(page).to have_field(:start_date)
    end
    
    within('#formline3') do
      expect(page).to have_field(:end_date)
    end

    expect(page).to have_button("Update")
  end

  it 'redirects to the trip show page upon update' do
    click_on "Trippin"
    click_button "Update Trip"

    fill_in(:name, with: "Trippin")
    fill_in(:start_date, with: "2023-02-28")
    fill_in(:end_date, with: "2023-03-09")

    click_button("Update")

    expect(current_path).to eq trip_path(1)
  end
end