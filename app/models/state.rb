class State < ActiveRecord::Base
  has_many :counties
  belongs_to :countries
  attr_accessible :country_id, :cve_ent, :name
end
