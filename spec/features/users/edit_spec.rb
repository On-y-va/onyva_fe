require 'rails_helper'

RSpec.describe 'users edit page', :vcr do
  before :each do
    visit "/auth/google_oauth2"

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  
  it 'has a form to edit user' do
    click_button 'Edit Profile'

    expect(page).to have_field(:first_name)
    expect(page).to have_field(:last_name)
    expect(page).to have_field(:phone_number)
    expect(page).to have_field(:emergency_contact_name)
    expect(page).to have_field(:emergency_contact_phone_number)
    expect(page).to have_button("Update")
  end

  it 'redirects to the user show page upon successful update' do
    click_button 'Edit Profile'

    expect(page).to have_button "Update"
    expect(current_path).to eq(edit_user_path(1))

    fill_in(:phone_number, with: "123456789")
    fill_in(:emergency_contact_phone_number, with: "987654321")
    fill_in(:emergency_contact_name, with: "Ben Smith")

    click_on("Update")

    expect(current_path).to eq(user_path(1))
  end
end