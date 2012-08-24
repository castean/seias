#encoding:utf-8
class PriorityProgramActionLinesPrograms < ActiveRecord::Base
  has_and_belongs_to_many :priority_program_action_lines
<<<<<<< HEAD
  has_and_belongs_to_many :programs
  attr_accessible :program_id, :priority_program_action_line_id
  attr_accessor :program_id, :priority_program_action_line_id
end
=======
    has_and_belongs_to_many :programs
  attr_accessible :program_id, :priority_program_action_line_id
  attr_accessor :program_id, :priority_program_action_line_id
  

end
>>>>>>> 3b2b43998850474e29dc909f460e7491d1206757
