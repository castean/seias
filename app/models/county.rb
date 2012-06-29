class County < ActiveRecord::Base
  attr_accessible :cve_mun, :name, :state_id

  belongs_to :states, :foreign_key => "cve_ent"
  belongs_to :countries
  has_many :towns, :foreign_key => "county_id"
  
    before_destroy :check_for_county
  
  def check_for_county
    if towns.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
