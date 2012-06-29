class PedStrategy < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_goal_id
  belongs_to :ped_goal
  has_many :ped_action_lines
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_goal_id, :presence => true

  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if ped_action_lines.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
