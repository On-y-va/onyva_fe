require 'rails_helper'

RSpec.describe 'users new page', :vcr do
  it 'has a form to register a new user' do
    visit new_user_path(1)

    expect(page).to have_field(:first_name)
    expect(page).to have_field(:last_name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button("Register")
  end

  xit 'redirects to the user show page upon successful registration' do
    # TODO: implement faker for unique email
    visit new_user_path(1)

    fill_in(:first_name, with: "John")
    fill_in(:last_name, with: "Jenkins")
    fill_in(:email, with: "j@email.com")
    fill_in(:password, with: "test123")
    fill_in(:phone_number, with: "1234567890")
    fill_in(:password_confirmation, with: "test123")

    click_button("Register")

    expect(current_path).to eq(user_path(1))
  end
end