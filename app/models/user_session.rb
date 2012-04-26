class UserSession < Authlogic::Session::Base
  params_key :access_token

  def to_key
    [session_key]
  end
end