class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :stripe_customer_id, :profile_picture, :avatar, :subscription_id, :email, :password) }
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :stripe_customer_id, :profile_picture, :avatar, :subscription_id, :email, :password) }
  end

  # def after_sign_in_path_for(resource_or_scope)
  #   root_path || user_admin_path
  # end
  #
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_path(current_user.id)
    else
      admin_dashboard_path
    end
  end

end
