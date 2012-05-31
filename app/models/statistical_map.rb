class StatisticalMap < ActiveRecord::Base
  # attr_accessible :title, :body
   attr_accessor :country_id, :state_id, :county_id, :town_id, :institution_type_id
end
