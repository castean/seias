class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  attr_accessible :activity_date, :description, :value
end
