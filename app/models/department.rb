class Department < ActiveRecord::Base
  belongs_to :direction
  has_many :users
  has_many :programs
  has_many :critical_success_factors
  attr_accessible :name, :direction_id
  
    before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if programs.count > 0 and critical_success_factors.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
