class BenefitType < ActiveRecord::Base
  belongs_to :benefit_category
  attr_accessible :benefit_category_id, :name
end
