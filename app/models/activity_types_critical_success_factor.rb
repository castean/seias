#encoding:utf-8
class ActivityTypesCriticalSuccessFactor < ActiveRecord::Base
  attr_accessible :activity_type_id, :critical_success_factor_id
  attr_accessor :activity_type_id, :critical_success_factor_id
end