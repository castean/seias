class Benefit < ActiveRecord::Base
  belongs_to :affiliate
  belongs_to :worth
  belongs_to :benefit_type
  has_many :period_time_delivers

  attr_accessor :benefit_category_id, :period_number
  attr_accessible :affiliate_id, :benefit_type_id, :delivery_date, :period, :qty, :unit_price, :worth_id,:benefit_category_id, :period_number

  validates :delivery_date, :presence => true

  validates :qty, :presence => true
  validates :unit_price, :presence => true
  validates :worth_id, :presence => true
  validates :benefit_type_id, :presence => true

  after_create :update_delivered

  def update_delivered
    @unpaid_delivers = PeriodTimeDeliver.find_by_affiliate_id_and_period_number(self.affiliate_id,self.period_number) # I'm assuming Payment belongs_to User
    @unpaid_delivers.update_attributes(:benefit_id => self.id ,:delivered => true)
  end

end
