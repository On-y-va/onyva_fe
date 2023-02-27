module UserHelper
  def update_params
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      emergency_contact_name: params[:emergency_contact_name],
      emergency_contact_phone_number: params[:emergency_contact_phone_number]
      }
  end
end