class Relationship < ActiveRecord::Base
  has_many :people, :foreign_key => "tutor_relationship_id"
  has_many :families

  attr_accessible :name
end
