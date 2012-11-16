class Benefit < ActiveRecord::Base
  belongs_to :affiliate
  belongs_to :worth
  belongs_to :benefit_type
  attr_accessor :benefit_category_id
  attr_accessible :affiliate_id, :benefit_type_id, :delivery_date, :period, :qty, :unit_price, :worth_id,:benefit_category_id

  validates :delivery_date, :presence => true
  validates :period, :presence => true
  validates :qty, :presence => true
  validates :unit_price, :presence => true
  validates :worth_id, :presence => true
  validates :benefit_type_id, :presence => true
end
