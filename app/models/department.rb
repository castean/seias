class Department < ActiveRecord::Base
  belongs_to :direction
   attr_accessible :name, :direction_id
end
