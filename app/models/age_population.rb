class AgePopulation < ActiveRecord::Base
  belongs_to :institution
  belongs_to :age_range
  attr_accessible :age_range_id, :guardianship_id, :institution_id, :real_qty_registered, :sex_id, :total_qty_registered
end
