class Place < ActiveRecord::Base
  belongs_to :place_type
  belongs_to :towns
  attr_accessible :address, :gmaps, :info, :latitude, :longitude, :name, :place_type, :town_id
  attr_accessor :county_id, :state_id, :country_id
  
  acts_as_gmappable
  def gmaps4rails_address
    name 
  end
  def gmaps4rails_infowindow
      "<b>#{name}</b></br>#{info}</br>#{latitude}</br>#{longitude}"# add here whatever html content you desire, it will be displayed when users clicks on the marker
  end
end
