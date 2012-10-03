class BusinessLine < ActiveRecord::Base
  belongs_to :institutions_type
  attr_accessible :name, :institution_type_id
end
