class ActivityType < ActiveRecord::Base
  attr_accessible :description, :measurement, :measurement_description, :name
  belongs_to :UnitOfMeasurement
end
