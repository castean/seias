class Program < ActiveRecord::Base
  attr_accessible :department_id, :description, :name, :responsable_id
  validates :department_id, :description, :name, :responsable_id, :presence => true
end
