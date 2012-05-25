class Program < ActiveRecord::Base
  has_many :critical_success_factors
  belongs_to :direction
  belongs_to :department
  attr_accessible :department_id, :description, :name, :responsable_id, :direction_id
  validates :department_id, :description, :name, :responsable_id, :presence => true
end
