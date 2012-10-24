#encoding:utf-8
class Goal < ActiveRecord::Base
  belongs_to :critical_factors
  attr_accessible :excelent, :minimum, :month, :satisfying, :year

  validates :excelent, :presence => true
  validates :minimum, :presence => true
  validates :month, :presence => true
  validates :satisfying, :presence => true
  validates :year, :presence => true
end
