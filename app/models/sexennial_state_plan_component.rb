class SexennialStatePlanComponent < ActiveRecord::Base
  has_many :critical_success_factors

  attr_accessible :title, :description
end
