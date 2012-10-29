class Family < ActiveRecord::Base
  belongs_to :person
  belongs_to :kin, :class_name => 'Person'
  belongs_to :relationship
  attr_accessible :kin_id, :person_id, :relationship_id, :income
end
