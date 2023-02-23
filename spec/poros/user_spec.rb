require 'rails_helper'

RSpec.describe User do
  it 'exist and has attributes' do
    data = {
            email: "b@email.com",
            emergency_contact_name: nil,
            emergency_contact_phone_number: nil,
            first_name: "Braxton",
            id: "1",
            last_name: "Eddings",
            phone_number: "1234567"
          }

    user = User.new(data)

    expect(user).to be_a(User)
    expect(user.id).to eq("1")
    expect(user.first_name).to eq("Braxton")
    expect(user.last_name).to eq("Eddings")
    expect(user.phone_number).to eq("1234567")
    expect(user.email).to eq("b@email.com")
    expect(user.emergency_contact_name).to eq(nil)
    expect(user.emergency_contact_phone_number).to eq(nil)
  end
end