class PeriodTime < ActiveRecord::Base
  attr_accessible :name
  has_many :critical_factors
end
