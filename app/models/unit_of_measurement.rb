class UnitOfMeasurement < ActiveRecord::Base
  has_many :critical_success_factors
  has_many :activity_types
  attr_accessible :name
  
    before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if activity_types.count > 0 and critical_success_factors.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
