class Guardianship < ActiveRecord::Base
  has_many :school_ages
  attr_accessible :name
end
