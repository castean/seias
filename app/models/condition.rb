class Condition < ActiveRecord::Base
  has_many :socioeconomic_studies
  attr_accessible :description, :final_value, :initial_value
end
