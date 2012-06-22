class Department < ActiveRecord::Base
  belongs_to :direction
  has_many :users
  has_many :programs
  has_many :critical_success_factors
  attr_accessible :name, :direction_id
end
