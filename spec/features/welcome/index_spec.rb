require 'rails_helper'

RSpec.describe 'welcome page', :vcr do
  before :each do
    visit root_path
  end

  it 'has the onyva logo' do
    within ('#logo') do
      expect(page).to have_css("img[src*='https://raw.githubusercontent.com/On-y-va/onyva_fe/main/src/assets/onyva_logo.png']")
    end
  end

  it 'has a button to continue with google' do
    expect(page).to have_button 'Continue with Google'
  end
end