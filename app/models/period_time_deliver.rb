class PeriodTimeDeliver < ActiveRecord::Base
  belongs_to :affiliate
  belongs_to :period_time
  attr_accessible :affiliate_id, :benefit_id, :delivered, :period_number, :period_time_id
end
