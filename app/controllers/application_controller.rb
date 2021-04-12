class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    if params[:user]
      user_params_hash = params.require(:user)
      user_params_hash[:address] = user_params_hash[:prefecture_code] + user_params_hash[:city] + user_params_hash[:street]
    end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :postal, :address])
  end
end
