class AgePopulation < ActiveRecord::Base
  attr_accessible :age_range_id, :guardianship_id, :institution_id, :real_qty_registered, :sex_id, :total_qty_registered
end
