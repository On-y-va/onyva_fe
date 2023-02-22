require 'rails_helper'

RSpec.describe UserFacade do
  xit 'returns a user poro' do
   user = UserFacade.one_user(1)
   
   expect(user).to be_a(User)
  end
end