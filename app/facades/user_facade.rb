class UserFacade
  def self.one_user(id)
    result = OnyvaService.one_user(id)
    return User.new(result)
  end
  
  # def self.delete_one_user(id)
  #   result = OnyvaService.delete_one_user(id)
  #   User.new(result)
  # end
  
  def self.find_by_google_uid(google_uid)
    result = OnyvaService.find_user_by_google_uid(google_uid)
    if result == {}
      return nil
    else
    User.new(result)
    end
  end

  def self.update_user(id, update_params)
    result = OnyvaService.update_user(id, update_params)
    User.new(result)
  end

  def self.user_trips(user_id, status)
    results = OnyvaService.user_trips(user_id, status)
    results.map do |user_trip|
      UserTrip.new(user_trip)
    end
  end
end