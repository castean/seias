class User < ActiveRecord::Base

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    config.validate_password_field = true
    config.logged_in_timeout = 1.day
  end

  has_many :critical_success_factors

  attr_accessible :login, :email, :name, :last_name, :second_last_name
end
