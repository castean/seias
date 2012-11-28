class PeriodTimeDeliver < ActiveRecord::Base
  belongs_to :affiliate
  belongs_to :period_time
  has_many :benefits
  attr_accessible :affiliate_id, :benefit_id, :delivered, :period_number, :period_time_id
end
