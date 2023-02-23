require 'rails_helper'

RSpec.describe 'welcome page' do
  it 'contains a header' do
    visit root_path

    expect(page).to have_content("Welcome to ONYVA")
  end
end