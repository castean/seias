#encoding:utf-8
class OfficeAllocation < ActiveRecord::Base
  belongs_to :office
  belongs_to :user
  attr_accessible :infot, :location_status, :move_by_user_id, :office_id, :place, :to, :user_id
end
