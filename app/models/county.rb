class County < ActiveRecord::Base
  attr_accessible :cve_mun, :name, :state_id
  belongs_to :states
  has_many :towns
end
