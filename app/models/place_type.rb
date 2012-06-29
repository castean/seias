class PlaceType < ActiveRecord::Base
  has_many :places
  attr_accessible :description, :name, :nick
    before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if places.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
  
end
