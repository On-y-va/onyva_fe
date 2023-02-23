require 'rails_helper'

RSpec.describe 'welcome page' do
  before :each do
    visit root_path
  end

  it 'contains a header' do
    expect(page).to have_content("Welcome to ONYVA")
  end

  xit 'has a button to register' do
    expect(page).to have_button 'Register'

    click_button 'Register'
    expect(current_path).to eq new_user_path
  end

  it 'has a button to Log In' do
    expect(page).to have_button 'Log In'
    click_button 'Log In'
    expect(current_path).to eq "/login"
  end
end