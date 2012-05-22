class ActivityType < ActiveRecord::Base
  attr_accessible :description, :measurement_id, :measurement_description, :name
  belongs_to :UnitOfMeasurement
end
