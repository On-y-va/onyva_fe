class UserFacade

  def self.one_user(id)
    result = OnyvaService.one_user(id)
    user = User.new(result)
  end

  def self.delete_one_user(id)
    result = OnyvaService.delete_one_user(id)
    user = User.new(result)
  end
end