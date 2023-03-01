require 'rails_helper'

RSpec.describe UserFacade do
  describe '#one_user' do
    it 'returns a user poro', :vcr do
      user = UserFacade.one_user(2)
      
      expect(user).to be_a(User)
    end
  end

  describe '#user_trips' do
    it 'returns a trip poro', :vcr do
      user_trip = UserFacade.user_trips(2, 0)
      
      expect(user_trip[0]).to be_a(UserTrip)
    end
  end

  describe '#find_by_google_uid' do
    it 'returns a user based off the google uid', :vcr do
      user = UserFacade.find_by_google_uid(109319244970235769326)

      expect(user).to be_a(User)
    end
  end

  describe '#update_user' do
    it 'returns an updated user', :vcr do
      update_params = {name: "Ted"}
      user = UserFacade.update_user(2, update_params)

      expect(user).to be_a(User)
    end
  end

  describe '#create_user' do
    it 'returns a created user', :vcr do

      user = {
        id: 1,
        attributes: {
                      first_name: "John",
                      last_name: "Jones",
                      email: "john@gmail.com",
                      google_uid: "sdfefefe"
                    }
              }

      user = UserFacade.create_user(user)

      expect(user).to be_a(User)
    end
  end
end