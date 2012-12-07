class Grade < ActiveRecord::Base
  has_many :people
  has_many :school_ages
  attr_accessible :name
end
