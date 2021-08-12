class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

 #ログイン後の遷移画面(管理者&顧客)
  def after_sign_in_path_for(resource)
    case resource
    when Admin
    admin_animes_path
    when Customer
      user_animes_path
    end
  end

  #ログアウト後の遷移画面(管理者&顧客)
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
