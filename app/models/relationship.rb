class Relationship < ActiveRecord::Base
  has_many :people, :foreign_key => "tutor_relationship_id"
  attr_accessible :name
end
