class AgeRange < ActiveRecord::Base
  has_many :institutions
  has_many :age_populations
  attr_accessible :name
end
