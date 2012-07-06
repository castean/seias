class Ped < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :name, :ped_program
  has_many :ped_program_definitions
  has_many :ped_axis_developments
  validates :name, :presence => true
  validates :description, :presence => true
  validates :date_end, :presence => true
  validates :date_start, :presence => true

  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if ped_axis_developments.count > 0 and ped_program_definitions.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
