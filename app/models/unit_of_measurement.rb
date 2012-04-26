class UnitOfMeasurement < ActiveRecord::Base
  has_many :critical_success_factors

  attr_accessible :name
end
