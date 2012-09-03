class Group < ActiveRecord::Base
  attr_accessible :description, :name, :vulnerable
  has_many :activities
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if activities.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
