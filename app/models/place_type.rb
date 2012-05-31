class PlaceType < ActiveRecord::Base
  has_many :places
  attr_accessible :description, :name, :nick
end
