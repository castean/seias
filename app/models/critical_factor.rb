#encoding:utf-8
class CriticalFactor < ActiveRecord::Base
  belongs_to :criterion_of_measurement
  has_and_belongs_to_many :catalog_tables
  has_many :goals
  belongs_to :unit_of_measurement
  belongs_to :critical_success_factor_type
  belongs_to :user
  belongs_to :period_time
  belongs_to :program
  belongs_to :department


  attr_accessible :critical_success_factor_type_id, :name, :description, :unit_of_measurement_id, :percentage, :criterion_of_measurement_id, :catalog_table_id, :catalog_table_reference,
                  :program_id,:objective_minimum,:objective_satisfying,:objective_excelent, :critical_factor_id, :period_time_id, :responsable_id,
                  #Para seleccionar multiples opciones de tabla a afectar antes de crear un factor critico
                  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft

  validates :name, :presence => true
  validates :description, :presence => true
  validates :percentage, :presence => true
  validates :unit_of_measurement_id, :presence => true

  #after_save :save_selectright

  #def save_selectright
  # @test2 = self.selectRight.map { |k,v| "#{k} is #{v}" }

  # print(@test2)

  #  self.selectRight.each_pair do |t|
  #    a = CatalogTablesCriticalFactor.new
  #      a.catalog_table_id = self.catalog_table_id
  #      a.critical_factor_id = self.id
  #      a.table_select_field_id = t.proc_id
  #    a.save
  #  end
  #end

  #validates :unit_of_measurement_description, :presence => true

  #validates :confidential, :presence => true
  #validates :sexennial_state_plan_component_id, :presence => true
  #validates :program_id, :presence => true


  #before_destroy :check_for_dependencias

  #def check_for_dependencias
  #  if activity_types.count > 0
  #    errors.add_to_base("No se pueden borrar mientras tenga dependencias")
  #    return false
  #  end
  #end

  def selectRight=(options)
    self.catalog_tables.clear
    options.each do |option|
      unless option.empty?
        line = CatalogTable.find(catalog_table_id)
        modelo = line.model
        case modelo
          when 'ActivityTypes'
            line = ActivityType.find(options,options.id)
          when 'Programs'
            line = Program.find(options)
        end

        self.catalog_tables << line
      end
    end
  end
end
