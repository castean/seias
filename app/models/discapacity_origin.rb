class DiscapacityOrigin < ActiveRecord::Base
  has_many :people
  attr_accessible :name
end
