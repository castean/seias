class Program < ActiveRecord::Base
  has_many :critical_success_factors
  attr_accessible :department_id, :description, :name, :responsable_id
  validates :department_id, :description, :name, :responsable_id, :presence => true
end
