class Benefit < ActiveRecord::Base
  attr_accessible :affiliate_id, :benefit_category_id, :delivery_date, :period, :qty, :unit_price, :worth
end
