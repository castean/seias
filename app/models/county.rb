class County < ActiveRecord::Base
  attr_accessible :cve_mun, :name, :state_id
  belongs_to :states
end
