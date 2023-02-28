class UserFacade
  def self.one_user(id)
    result = OnyvaService.one_user(id)
    # require 'pry'; binding.pry
    return User.new(result)
  end
  
  def self.delete_one_user(id)
    result = OnyvaService.delete_one_user(id)
    User.new(result)
  end
  
  def self.find_by_google_uid(google_uid)
    result = OnyvaService.find_user_by_google_uid(google_uid)
    if result == {}
      return nil
    else
      User.new(result)
    end
  end

  def self.update_user(id)
    result = OnyvaService.update_user(id)
    User.new(result)
  end

  def self.create_user(user)
    result = OnyvaService.create_user(user)
    User.new(result)
  end
end