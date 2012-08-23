class PriorityProgramActionLine < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :ped_action_line_id, :priority_program_strategy_id
  belongs_to :priority_program_strategy
  belongs_to :ped_action_line
  has_and_belongs_to_many :programs
  has_many :critical_success_factors, :through => :programs, :source => :priority_program_action_lines
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :ped_action_line_id, :presence => true
  validates :priority_program_strategy_id, :presence => true
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if programs.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
