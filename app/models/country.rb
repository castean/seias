class Country < ActiveRecord::Base
  attr_accessible :name
  has_many :states, :foreign_key => "state_id"
  has_many :counties, :foreign_key => "county_id"
  has_many :towns, :foreign_key => "cve_loc"
  
  before_destroy :check_for_country
  
  def check_for_country
    if states.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependientes")
      return false
    end
  end
end
