require 'rails_helper'

RSpec.describe OnyvaService do

  describe '#one_user' do
    xit 'returns one user' do
      user = OnyvaService.one_user(1)
      
      expect(user).to have_key(:id)
      expect(user[:id]).to be_a(String)
      expect(user).to have_key(:first_name)
      expect(user[:first_name]).to be_a(String)
      expect(user).to have_key(:last_name)
      expect(user[:last_name]).to be_a(String)
      expect(user).to have_key(:phone_number)
      expect(user[:phone_number]).to be_a(String)
      expect(user).to have_key(:email)
      expect(user[:email]).to be_a(String)
      expect(user).to have_key(:emergency_contact_name)
      expect(user[:emergency_contact_name]).to be_a(String)
      expect(user).to have_key(:emergency_contact_phone_number)
      expect(user[:emergency_contact_phone_number]).to be_a(String)
    end
  end
end