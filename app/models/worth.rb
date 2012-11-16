class Worth < ActiveRecord::Base
  belongs_to :direction
  has_many :benefits
  attr_accessible :direction_id, :name
end
