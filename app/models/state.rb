class State < ActiveRecord::Base
  has_many :counties, :foreign_key => "county_id"
  has_many :towns, :foreign_key => "cve_loc"
  belongs_to :countries
  attr_accessible :country_id, :cve_ent, :name
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if counties.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
