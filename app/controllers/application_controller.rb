class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def development_enviroment?
    ['development', 'test'].include?(Rails.env)
  end

  helper_method :email_view?
  def email_view?
    params[:email_view] == '1'
  end

end
