require 'rails_helper'

RSpec.describe EventFacade do
  it 'returns a trip event poro' do
   event = EventFacade.events(1)

   expect(event).to be_a(Array)
   expect(event[1]).to be_a(Event)
  end
end