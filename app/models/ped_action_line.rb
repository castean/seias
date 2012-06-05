class PedActionLine < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_strategy_id
  belongs_to :ped_strategy
end
