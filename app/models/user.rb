class User < ActiveRecord::Base

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    config.validate_password_field = false if Seias::Application.config.ldap_auth
    config.logged_in_timeout = 1.day
  end

  easy_roles :roles
 
  has_many :critical_success_factors
  has_many :activities
  has_many :programs
  belongs_to :department

  attr_accessible :login, :email, :name, :last_name, :second_last_name, :password, :password_confirmation, :department_id, :roles 

  ROLES = %w[admin moderator user]
 
  serialize :roles
 
  def fullname
    "#{name} #{last_name} #{second_last_name}"
  end

  def role? role
    roles.include?(role.to_s)
  end
  protected
    def valid_ldap_credentials?(password)
      Ldap.valid?(self.login, password)
    end
end
