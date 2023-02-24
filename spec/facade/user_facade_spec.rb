require 'rails_helper'

RSpec.describe UserFacade do
  it 'returns a user poro', :vcr do
   user = UserFacade.one_user(1)
   
   expect(user).to be_a(User)
  end
end