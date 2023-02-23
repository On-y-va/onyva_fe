require 'rails_helper'

RSpec.describe OnyvaService do

  describe '#one_user' do
    it 'returns one user' do
      user = OnyvaService.one_user(1)

      expect(user).to have_key(:id)
      expect(user[:id]).to be_a(String)

      expect(user[:attributes]).to have_key(:first_name)
      expect(user[:attributes][:first_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:last_name)
      expect(user[:attributes][:last_name]).to be_a(String)
      expect(user[:attributes]).to have_key(:phone_number)
      expect(user[:attributes][:phone_number]).to be_a(String)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:emergency_contact_name)
      expect(user[:attributes]).to have_key(:emergency_contact_phone_number)
    end
  end
end