class UserSession < Authlogic::Session::Base
  
  params_key :access_token

  def to_key
    [session_key]
  end


   if Seias::Application.config.ldap_auth
    verify_password_method :valid_ldap_credentials?
  end
 
end