require 'rails_helper'

RSpec.describe 'welcome page', :vcr do
  before :each do
    visit root_path
  end

  xit 'contains a header' do
    expect(page).to have_css(".logo")
    expect(page).to have_content("Welcome to ONYVA")
  end

  it 'has a button to register' do
    expect(page).to have_button 'Register'

    click_button 'Register'
    expect(current_path).to eq new_user_path
  end

  it 'has a button to Log In' do
    expect(page).to have_button 'Log In'
  end
end