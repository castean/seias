class County < ActiveRecord::Base
  attr_accessible :cve_mun, :name, :state_id
  belongs_to :states, :foreign_key => "cve_ent"
  belongs_to :countries
  has_many :towns, :foreign_key => "county_id"
end
