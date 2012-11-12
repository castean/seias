class Benefit < ActiveRecord::Base
  belongs_to :affiliate
  attr_accessible :affiliate_id, :benefit_category_id, :delivery_date, :period, :qty, :unit_price, :worth_id

end
