class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  belongs_to :activity_type
  belongs_to :user
  attr_accessible :activity_date, :description, :value, :town_id, :group_id, :public_target_id, :activity_type_id, :county_id, :user_id
  end
