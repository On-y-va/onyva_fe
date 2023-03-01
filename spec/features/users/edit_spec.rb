require 'rails_helper'

RSpec.describe 'users edit page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  
  it 'has a form to edit user' do
    visit edit_user_path(2)

    expect(page).to have_field(:first_name)
    expect(page).to have_field(:last_name)
    expect(page).to have_field(:phone_number)
    expect(page).to have_field(:emergency_contact_name)
    expect(page).to have_field(:emergency_contact_phone_number)
    expect(page).to have_button("Update")
  end

  it 'redirects to the user show page upon successful update' do
    visit edit_user_path(2)

    fill_in(:first_name, with: "Ashley")
    
    click_button("Update")

    #this within block is on user show page
    within("#user_name") do
      expect(page).to have_content("Ashley")
    end
  end
end