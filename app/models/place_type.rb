class PlaceType < ActiveRecord::Base
  has_many :places
  attr_accessible :description, :name, :nick
  
  acts_as_gmappable
  
  def gmaps4rails_address
    name 
  end
  def gmaps4rails_infowindow
      "<b>#{name}</b></br>#{info}"# add here whatever html content you desire, it will be displayed when users clicks on the marker
  end
end
