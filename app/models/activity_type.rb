class ActivityType < ActiveRecord::Base
  attr_accessible :description, :measurement_id, :measurement_description, :name, :critical_success_factor_id, :priority, :user_id
  belongs_to :unit_of_measurement
  belongs_to :CriticalSuccessFactor
  validates :name, :presence => true
  validates :measurement_id, :presence => true
  validates :critical_success_factor_id, :presence => true
  has_many :activities
end