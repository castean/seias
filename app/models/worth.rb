class Worth < ActiveRecord::Base
  belongs_to :direction
  belongs_to :benefit
  attr_accessible :direction_id, :name
end
