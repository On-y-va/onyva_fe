require 'rails_helper'

RSpec.describe 'users edit page', :vcr do
  it 'has a form to edit user' do
    visit edit_user_path

    expect(page).to have_field(:phone_number)
    expect(page).to have_field(:emergency_contact_name)
    expect(page).to have_field(:emergency_contact_phone_number)
    expect(page).to have_button("Update")
  end

  it 'redirects to the user show page upon successful update' do
    # need a user to update
    visit edit_user_path

    fill_in(:phone_number, with: "111111111111")
    
    click_button("Update")

    expect(current_path).to eq(user_path(1))
    # expect(@user.1).to have(:phone_number '111111111111')
  end
end