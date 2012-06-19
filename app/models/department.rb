class Department < ActiveRecord::Base
  belongs_to :direction
  has_many :users
  attr_accessible :name, :direction_id
end
