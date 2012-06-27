class Program < ActiveRecord::Base
  has_many :critical_success_factors
  belongs_to :direction
  belongs_to :department
  belongs_to :user
  has_and_belongs_to_many :priority_program_action_lines
  attr_accessible :department_id, :description, :name, :responsable_id, :direction_id, :priority_program_action_line_id,
  #Para seleccionar multiples lineas de accion antes de crear un Programa
  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft

  def selectRight=(options)

    self.priority_program_action_lines.clear

    options.each do |option|
      unless option.empty?
        line = PriorityProgramActionLine.find(option)
        self.priority_program_action_lines << line
      end
    end
  end

  validates :department_id, :description, :name, :responsable_id, :presence => true
end
