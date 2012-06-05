class PriorityProgramActionLine < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_action_line_id, :priority_program_strategy_id
  belongs_to :priority_program_strategy
  belongs_to :ped_action_line
end
