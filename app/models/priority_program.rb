class PriorityProgram < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name
  has_many :priority_program_goals
  validates :name, :presence => true
  validates :description, :presence => true
  validates :date_start, :presence => true
  validates :date_end, :presence => true
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if priority_program_goals.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
