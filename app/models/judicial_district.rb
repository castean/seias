class JudicialDistrict < ActiveRecord::Base
  attr_accessible :name, :circunscription
  has_and_belongs_to_many :counties
  validates :name, :presence => true
  before_destroy :check_for_dependencias

  def check_for_dependencias
    if counties.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
