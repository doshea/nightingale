class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private
  def authenticate
    @current_user = Patient.find_by_auth_token( cookies[:auth_token]) || Provider.find_by_auth_token( cookies[:auth_token]) || Admin.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
    @current_user ||= session[:user_id].present? ? User.find(session[:user_id]) : nil
  end

  def ensure_logged_in
    redirect_to(account_required_path) if @current_user.nil?
  end

  def ensure_admin
    redirect_to(unauthorized_path) if (@current_user.nil? || !@current_user.is_admin)
  end

  def ensure_provider
    redirect_to(unauthorized_path) if (@current_user.nil? || !@current_user.provider)
  end
end
