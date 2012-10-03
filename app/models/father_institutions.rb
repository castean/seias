class FatherInstitutions < ActiveRecord::Base
  has_and_belongs_to_many :institutions
  attr_accessible :father_institution_id, :institution_id
end
