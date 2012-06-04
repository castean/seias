class Place < ActiveRecord::Base
  belongs_to :place_type
  belongs_to :towns
  attr_accessible :address, :gmaps, :info, :latitude, :longitude, :name, :place_type, :town_id
  attr_accessor :county_id, :state_id, :country_id
  
  def gmaps4rails_address
    name 
  end
end
