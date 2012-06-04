class Town < ActiveRecord::Base
  attr_accessible :altitude, :county_id, :cve_carta, :cve_loc, :environment, :lat, :latitude, :lon, :longitude, :name

  belongs_to :counties, :foreign_key => "cve_mun"
  has_many :places

  acts_as_gmappable
  
  def gmaps4rails_address
    name 
  end
end
