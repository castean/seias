class UserSession < Authlogic::Session::Base
  
  params_key :access_token

  def to_key
    [session_key]
  end

  case Seias::Application.config.authorization_method
    when :ldap then verify_password_method :valid_ldap_credentials?
  end
 
end