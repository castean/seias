class InstitutionsType < ActiveRecord::Base
  has_many :business_lines
  attr_accessible :name
end
