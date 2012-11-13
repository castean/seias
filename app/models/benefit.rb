class Benefit < ActiveRecord::Base
  belongs_to :affiliate
  has_many :worths
  belongs_to :benefit_type
  attr_accessor :benefit_category_id
  attr_accessible :affiliate_id, :benefit_type_id, :delivery_date, :period, :qty, :unit_price, :worth_id,:benefit_category_id

end
