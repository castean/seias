class PedSubTheme < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :ped_goals
end
