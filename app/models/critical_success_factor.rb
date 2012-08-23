#encoding:utf-8
class CriticalSuccessFactor < ActiveRecord::Base

  belongs_to :unit_of_measurement
  #belongs_to :sexennial_state_plan_component
  belongs_to :user
  belongs_to :program
  belongs_to :department 
  has_and_belongs_to_many :activity_types

  attr_accessible :title, :description, :unit_of_measurement_id, :percentage,
                  :unit_of_measurement_description, :program_id, :program_idbck,
                  #Para seleccionar multiples lineas de accion a afectar antes de crear un factor critico
                  :selectRight, :selectLeft  ,:selectLeftbck
  attr_accessor :selectRight, :selectLeft  ,:selectLeftbck,:program_idbck
  validates :title, :presence => true
  validates :description, :presence => true
  validates :percentage, :presence => true
  validates :unit_of_measurement_id, :presence => true
  validates :unit_of_measurement_description, :presence => true

  #validates :confidential, :presence => true
  #validates :sexennial_state_plan_component_id, :presence => true
  validates :program_id, :presence => true
  
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if activity_types.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
