class PeopleByRoom < ActiveRecord::Base
  has_many :socioeconomic_studies
  attr_accessible :description, :point
end
