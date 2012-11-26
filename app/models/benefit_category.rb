class BenefitCategory < ActiveRecord::Base
  has_many :benefit_types
  has_many :offices
  has_many :office_benefit_requesteds
  attr_accessible :name
end
