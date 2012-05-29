class State < ActiveRecord::Base
  has_many :counties, :foreign_key => "county_id"
  has_many :towns, :foreign_key => "cve_loc"
  belongs_to :countries
  attr_accessible :country_id, :cve_ent, :name
end
