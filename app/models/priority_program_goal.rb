class PriorityProgramGoal < ActiveRecord::Base
  attr_accessible :description, :hierarchy, :name, :priority_program_id
  belongs_to :priority_programs
  has_many :priority_program_strategies
  validates :name, :presence => true
  validates :description, :presence => true
  validates :hierarchy, :presence => true
  validates :priority_program_id, :presence => true
end
