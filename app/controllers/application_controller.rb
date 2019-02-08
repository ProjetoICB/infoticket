class ApplicationController < ActionController::Base
  protect_from_forgery

  include WelcomeHelper
  include LogsHelper

  def usuario_autenticado?
    if session[:login].blank?
      redirect_to welcome_login_path
      return false
    end
  end

=begin
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]  #token de autenticacao
  end

=end


end