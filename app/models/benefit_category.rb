class BenefitCategory < ActiveRecord::Base
  has_many :benefit_types
  attr_accessible :name
end
