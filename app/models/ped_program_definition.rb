class PedProgramDefinition < ActiveRecord::Base
  attr_accessible :description, :name, :ped_id
  belongs_to :ped
  has_and_belongs_to_many :ped_axis_developments
  before_destroy :check_for_dependencias
  validates :name, :presence => true
  validates :description, :presence => true
  validates :ped_id, :presence => true
  
  def check_for_dependencias
    if ped_axis_developments.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
