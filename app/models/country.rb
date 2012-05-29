class Country < ActiveRecord::Base
  attr_accessible :name
  has_many :states, :foreign_key => "state_id"
  has_many :counties, :foreign_key => "county_id"
  has_many :towns, :foreign_key => "cve_loc"
end
