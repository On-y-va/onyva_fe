Rails.application.config.middleware.use OmniAuth::Builder do
  # Rails/env.production
  if ENV['RAILS_ENV'] == "production"
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    {
      redirect_uri: "https://onyva.herokuapp.com/auth/google_oauth2/callback"
    } 
  else
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    {
      redirect_uri: "http://localhost:3000/auth/google_oauth2/callback"
    }
  end

 end
 OmniAuth.config.allowed_request_methods = %i[get]
 
 