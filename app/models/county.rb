class County < ActiveRecord::Base
  attr_accessible :cve_mun, :name, :state_id

  belongs_to :states, :foreign_key => "cve_ent"
  belongs_to :countries
  #has_many :towns, :foreign_key => "county_id"
  has_many :towns,:primary_key => "cve_mun"
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :judicial_districts
  has_many :activities, :primary_key => "cve_mun"

  before_destroy :check_for_county
  
  def check_for_county
    if towns.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
