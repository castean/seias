class PedGoal < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_sub_theme_id
  belongs_to :ped
  belongs_to :ped_sub_theme
  has_many :ped_strategies
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_sub_theme_id, :presence => true
end
