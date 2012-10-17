class Grade < ActiveRecord::Base
  has_many :people, :foreign_key => "schooling"
  attr_accessible :name
end
