class Goal < ActiveRecord::Base
  belongs_to :critical_success_factor
  attr_accessible :excelent, :minimum, :month, :satisfying, :year

  validate :excelent, :minimum, :month, :satisfying, :year, :precense => true
end
