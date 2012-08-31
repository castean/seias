#encoding:utf-8
class PriorityProgramActionLinesPrograms < ActiveRecord::Base
  has_and_belongs_to_many :priority_program_action_lines

  has_and_belongs_to_many :programs
  attr_accessible :program_id, :priority_program_action_line_id
  attr_accessor :program_id, :priority_program_action_line_id

end

