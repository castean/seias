class PedSubTheme < ActiveRecord::Base
  attr_accessible :description, :name, :ped_theme_id, :hierarchy
  has_many :ped_goals
  belongs_to :ped_theme
  before_destroy :check_for_dependencias
  validates :name, :presence => true
  validates :description, :presence => true
  validates :ped_id, :presence => true
  validates :hierarchy, :presence => true
  
  def check_for_dependencias
    if ped_goals.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end
end
