class Ped < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name
  has_many :ped_goals
  validates :name, :presence => true
  validates :description, :presence => true
  validates :date_end, :presence => true
  validates :date_start, :presence => true
end
