module TripAttendeeHelper
  def user_emails
    params[:user_emails].split(',').map(&:strip)
  end
end