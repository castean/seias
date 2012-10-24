class Documentation < ActiveRecord::Base
  has_and_belongs_to_many :people
  attr_accessible :belongs, :name
  OWNER = [["Personas", "1"], ["Instituciones","2"], ["Ambos", "3"]]

end
