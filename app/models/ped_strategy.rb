class PedStrategy < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_goal_id
  belongs_to :ped_goal
  has_many :ped_action_lines
end
