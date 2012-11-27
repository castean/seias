class PeriodTime < ActiveRecord::Base
  attr_accessible :name
  has_many :critical_factors
  has_many :affiliates
  has_many :period_time_delivers
end
