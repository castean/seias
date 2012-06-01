class Place < ActiveRecord::Base
  belongs_to :place_type
  attr_accessible :address, :gmaps, :info, :latitude, :longitude, :name, :place_type, :town_id
  attr_accessor :county_id, :state_id, :country_id
end
