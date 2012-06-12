class PedActionLine < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_strategy_id
  belongs_to :ped_strategy
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_strategy_id, :presence => true
end
