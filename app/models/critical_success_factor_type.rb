class CriticalSuccessFactorType < ActiveRecord::Base
  has_many :critical_success_factors

  validates :name, :presence => true

  attr_accessible :name
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if critical_success_factors.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
