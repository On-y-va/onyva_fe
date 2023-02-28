module SessionHelper
  def user(auth_hash)
    {
      first_name: auth_hash[:info][:first_name],
      last_name: auth_hash[:info][:last_name],
      email: auth_hash[:info][:unverified_email],
      google_uid: auth_hash[:uid]
    }
  end
end