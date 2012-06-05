class PedGoal < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_id
  belongs_to :ped
  has_many :ped_strategies
end
