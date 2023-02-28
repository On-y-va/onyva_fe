class EventFacade
  def self.events(id)
    results = OnyvaService.events(id)
    results.map do |event|
       Event.new(event)
    end
  end
end