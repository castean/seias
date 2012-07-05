class PedTheme < ActiveRecord::Base
  attr_accessible :description, :name, :ped_axis_development_id
  belongs_to :ped_axis_development
  has_many :ped_sub_themes
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if ped_sub_themes.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
