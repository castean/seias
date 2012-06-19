class User < ActiveRecord::Base

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    config.validate_password_field = true
    config.logged_in_timeout = 1.day
  end

  easy_roles :roles
 
  has_many :critical_success_factors
  has_many :activities
  belongs_to :department
  attr_accessible :login, :email, :name, :last_name, :second_last_name, :password, :password_confirmation, :initial_role, :roles, :department_id
  attr_accessor :initial_role
  
  ROLES = %w[admin moderator user final_user]
  

  def fullname
    "#{name} #{last_name} #{second_last_name}"
  end
  def roles_list
    roles_sym_list = []
    ROLES.each do |role|
      roles_sym_list << role.to_sym
    end
    roles_sym_list
  end

  def has_role? role
    roles_list.include? role.to_sym
  end

end
