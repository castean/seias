class Direction < ActiveRecord::Base
  attr_accessible :name
  has_many :departments
  has_many :offices
  before_destroy :check_for_dependencias
  belongs_to :user
  has_many :worths

  def check_for_dependencias
    if departments.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
