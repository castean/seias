class Worth < ActiveRecord::Base
  belongs_to :direction
  attr_accessible :direction_id, :name
end
