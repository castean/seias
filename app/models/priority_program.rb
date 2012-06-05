class PriorityProgram < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name
  has_many :priority_program_goals
  validates :name, :presence => true
  validates :description, :presence => true
  validates :date_start, :presence => true
  validates :date_end, :presence => true
end
