class Family < ActiveRecord::Base
  belongs_to :person
  belongs_to :kin, :class_name => 'Person'
  belongs_to :relationship
  attr_accessible :kin_id, :person_id, :relationship_id
  validates_presence_of :kin_id, :person_id, :relationship_id
  validate :validate_kin_id
  validate :validate_relationship_id

  def validate_kin_id
    t = self.kin_id
    if t == 0
      errors.add('Familiar: ', "Selecciona Uno")
    end
  end
  def validate_relationship_id
    t = self.relationship_id
    if t == 0
      errors.add('Parentesco: ', "Selecciona Uno")
    end
  end
end
