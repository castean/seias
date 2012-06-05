class PriorityProgram < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name
  has_many :priority_program_goals
end
