#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  helper_method :current_user_session, :current_user


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acceso denegado"
    redirect_to rool_path
  end

  protected
  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def authenticate
    unless current_user_session
      current_path = request.env['PATH_INFO']
      unless current_path == "/"
        flash[:notice] = "No has iniciado sesión"
      end
      redirect_to new_user_sessions_path
      return false
    end
  end

end
