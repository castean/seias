class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  belongs_to :activity_type
  attr_accessible :activity_date, :description, :value, :town_id, :group_id, :public_target_id, :activity_type_id, :county_id
  end
