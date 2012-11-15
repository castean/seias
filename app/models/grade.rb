class Grade < ActiveRecord::Base
  has_many :people, :foreign_key => "schooling"
  has_many :school_ages
  attr_accessible :name
end
