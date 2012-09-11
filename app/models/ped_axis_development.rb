class PedAxisDevelopment < ActiveRecord::Base
  attr_accessible :description, :name, :ped_id,
                  #Para seleccionar multiples definiciones de programa antes de crear un eje de desarrollo
                  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft
  has_and_belongs_to_many :ped_program_definition
  belongs_to :ped
  has_many :ped_themes
  before_destroy :check_for_dependencias
  validates :name, :presence => true
  validates :description, :presence => true
  validates :ped_id, :presence => true
  
  def check_for_dependencias
    if ped_themes.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end

  def selectRight=(options)

    self.ped_program_definition.clear

    options.each do |option|
      unless option.empty?
        line = PedProgramDefinition.find(option)
        self.ped_program_definition << line
      end
    end
  end
end
