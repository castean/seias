class Town < ActiveRecord::Base
  attr_accessible :altitude, :county_id, :cve_carta, :cve_loc, :environment, :lat_dec, :latitude, :leng_dec, :length, :name

  belongs_to :counties, :foreign_key => "cve_mun"


end
