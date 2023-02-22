require 'rails_helper'

RSpec.describe 'user show' do
  before :each do
    visit user_path
  end

  xit 'displays the users name' do
    expect(page).to have_content('John')
  end

  xit 'has a button to create a trip' do
    click_button 'Create Trip'

    expect(current_path).to eq '/trips/new'
  end

  xit 'has a button to edit profile' do
    click_button 'Edit profile'

    expect(current_path).to eq 'user/id/edit'
  end

  xit 'has a section for upcoming trips' do
    expect(page).to have_content('Upcoming Trips')
  end

  xit 'has a section for pending trips' do
    expect(page).to have_content('Pending Trips')
  end
end