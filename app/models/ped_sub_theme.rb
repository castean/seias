class PedSubTheme < ActiveRecord::Base
  attr_accessible :description, :name, :ped_id
  has_many :ped_goals
  belongs_to :ped
end
