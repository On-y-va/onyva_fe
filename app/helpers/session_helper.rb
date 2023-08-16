module SessionHelper
  def user(auth_hash)
    {
      first_name: auth_hash[:info][:first_name],
      last_name: auth_hash[:info][:last_name],
      email: auth_hash[:info][:unverified_email],
      google_uid: auth_hash[:uid]
    }
  end

  private

  def find_or_create_from_auth_hash(auth_hash)
    user ||= UserFacade.find_by_google_uid(auth_hash[:uid])
    if user
      session[:user_id] = user.id
    else
      user = UserFacade.create_user(user(auth_hash))
      session[:user_id] = user.id 
    end
  end
end