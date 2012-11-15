class Town < ActiveRecord::Base
  attr_accessible :altitude, :county_id, :cve_carta, :cve_loc, :environment, :lat, :latitude, :lon, :longitude, :name

  #belongs_to :county
  belongs_to :county, :primary_key => "cve_mun"
  has_many :places
  #has_many :people, :primary_key => "born_town_id"
  has_many :people, :primary_key => "town_id"
  has_many :activities


  acts_as_gmappable
  
  def gmaps4rails_address
    name 
  end
end
