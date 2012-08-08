#encoding:utf-8
class Program < ActiveRecord::Base
  DAYS = (1..31)
  
  belongs_to :direction
  belongs_to :department
  belongs_to :user
  has_many :critical_success_factors
  has_and_belongs_to_many :priority_program_action_lines
  attr_accessible :department_id, :description, :name, :responsable_id, :direction_id,:priority_program_action_line_id , :cut_day, :start_date,
  #Para seleccionar multiples lineas de accion antes de crear un Programa
  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft
  
  validates :department_id, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :responsable_id, :presence => true
  validates :direction_id, :presence => true

  validates :cut_day, :presence => true
  validates :start_date, :presence => true
  #validates :selectRight, :presence => true
  validates :selectLeft, :presence => true
  
  before_destroy :check_for_dependencias
  
  def check_for_dependencias
    if critical_success_factors.count > 0
      errors.add_to_base("No se pueden borrar mientras tenga dependencias")
      return false
    end
  end

  def selectRight=(options)

    self.priority_program_action_lines.clear

    options.each do |option|
      unless option.empty?
        line = PriorityProgramActionLine.find(option)
        self.priority_program_action_lines << line
      end
    end
  end
end
