module SessionsHelper
  def user
    {
      first_name: auth_hash[:info][:first_name],
      last_name: auth_hash[:info][:last_name],
      email: auth_hash[:info][:unverified_email],
      uid: auth_hash[:uid]
    }
  end
end