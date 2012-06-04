class PlaceType < ActiveRecord::Base
  has_many :places
  attr_accessible :description, :name, :nick
  def gmaps4rails_address
    name 
  end
end
