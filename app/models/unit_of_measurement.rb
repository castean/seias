class UnitOfMeasurement < ActiveRecord::Base
  has_many :critical_success_factors
  has_many :activity_types
  attr_accessible :name
end
