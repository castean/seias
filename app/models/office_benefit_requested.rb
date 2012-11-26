#encoding:utf-8
class OfficeBenefitRequested < ActiveRecord::Base
  belongs_to :office
  belongs_to :benefit_type


  attr_accessible :benefit_type_id, :office_id, :qty_requested, :benefit_category_id
  attr_accessor :benefit_category_id


end
