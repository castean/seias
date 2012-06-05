class PedGoal < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_id
  belongs_to :ped
  has_many :ped_strategies
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_id, :presence => true
end
