class BenefitType < ActiveRecord::Base
  belongs_to :benefit_category
  has_many :office_benefit_requesteds
  has_many :offices
  attr_accessible :benefit_category_id, :name
end
