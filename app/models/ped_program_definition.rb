class PedProgramDefinition < ActiveRecord::Base
  attr_accessible :description, :name, :ped_id
  belongs_to :ped
  has_many :ped_axis_developments
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if ped_axis_developments.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end