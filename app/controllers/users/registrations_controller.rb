class Users::RegistrationsController < ApplicationController

  def create
    user = User.create!(permitted_params)
    user.update!(auth_token: Base64.encode64(user.email), role: 'gamer', is_active: true)
    render_success_response(user, "User Created Successfully!")
  end

  private

  def permitted_params
    params.require(:user).permit(:full_name, :mobile_number, :country_code, :email, :gender, :date_of_birth)
  end
end
