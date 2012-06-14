class PriorityProgramActionLine < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_action_line_id, :priority_program_strategy_id
  belongs_to :priority_program_strategy
  belongs_to :ped_action_line
  has_many :programs
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_action_line_id, :presence => true
  validates :priority_program_strategy_id, :presence => true
end
