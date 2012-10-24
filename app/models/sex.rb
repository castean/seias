class Sex < ActiveRecord::Base
  has_many :institutions
  has_many :one_reg_institutions, :foreign_key => "people_sex"
  has_many :people, :foreign_key => "sex"

  attr_accessible :name
end
