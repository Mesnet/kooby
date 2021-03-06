class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:pseudo, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:pseudo, :email, :password, :password_confirmation)
  end

  def after_inactive_sign_up_path_for(resource)
    '/users/sign_in' # Or :prefix_to_your_route
  end
  
end
