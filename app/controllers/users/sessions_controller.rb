class Users::SessionsController < ApplicationController

  ALLOWED_DISPLAY_COLUMNS = %w[full_name mobile_number country_code email gender date_of_birth auth_token is_active]
  def sign_in
    user = User.find_by_mobile_number(params[:mobile_number])
    if user.present?
      new_user = false
      user.update!(auth_token: Base64.encode64(user.email))
      user.reload
      resource = user.attributes.slice(*ALLOWED_DISPLAY_COLUMNS)
    else
      new_user = true
      resource = {}
    end
    render json: { new_user: new_user, resource: resource }
  end

end
