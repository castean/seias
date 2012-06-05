class PriorityProgramGoal < ActiveRecord::Base
  attr_accessible :description, :hirarchy, :name, :priority_program_id
  belongs_to :priority_programs
  has_many :priority_program_strategies
end
