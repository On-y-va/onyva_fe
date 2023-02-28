require 'rails_helper'

RSpec.describe UserFacade do
  it 'returns a user poro', :vcr do
    user = UserFacade.one_user(1)
    
    expect(user).to be_a(User)
  end
  
  it 'returns a trip poro' do
    user_trip = UserFacade.user_trips(2, 0)
    
    expect(user_trip).to be_a(UserTrip)
  end
end