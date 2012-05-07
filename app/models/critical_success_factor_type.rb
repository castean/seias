class CriticalSuccessFactorType < ActiveRecord::Base
  has_many :critical_success_factors

  validates :name, :presence => true

  attr_accessible :name
end
