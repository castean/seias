class Program < ActiveRecord::Base
  has_many :critical_success_factors
  belongs_to :direction
  belongs_to :department
  belongs_to :user
  has_and_belongs_to_many :priority_program_action_lines
  attr_accessible :department_id, :description, :name, :responsable_id, :direction_id, :priority_program_action_line_id
  validates :department_id, :description, :name, :responsable_id, :presence => true
end
