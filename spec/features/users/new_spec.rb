require 'rails_helper'

RSpec.describe 'users new page', :vcr do
  it 'has a form to register a new user' do
    visit new_user_path

    expect(page).to have_field(:first_name)
    expect(page).to have_field(:last_name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button("Register")
  end

  it 'redirects to the user show page upon successful registration' do
    visit new_user_path

    fill_in(:first_name, with: "John")
    fill_in(:last_name, with: "Jenkins")
    fill_in(:email, with: "j@email.com")
    fill_in(:password, with: "test123")
    fill_in(:password_confirmation, with: "test123")

    click_button("Register")

    expect(current_path).to eq(user_path(1))
  end
end