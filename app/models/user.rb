class User < ActiveRecord::Base

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    config.validate_password_field = false if Seias::Application.config.ldap_auth
    config.logged_in_timeout = 1.day
  end

  easy_roles :roles
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "52x52>" }
 
  has_many :critical_success_factors
  has_many :activities
  has_many :programs
  belongs_to :department

  attr_accessible :login, :email, :name, :last_name, :second_last_name, :password, :password_confirmation, :department_id, :roles, :avatar 
    
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if activity.count > 0 and critical_success_factors.count > 0 and programs.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end

  ROLES = %w[admin moderator user planeacion]
 
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
