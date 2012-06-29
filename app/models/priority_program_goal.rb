class PriorityProgramGoal < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :priority_program_id
  belongs_to :priority_program
  has_many :priority_program_strategies
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :priority_program_id, :presence => true

  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if priority_program_strategies.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
