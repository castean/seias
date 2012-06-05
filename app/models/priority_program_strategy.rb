class PriorityProgramStrategy < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :priority_program_goal_id
  belongs_to :priority_program_goal
  has_many :priority_program_action_line
end
