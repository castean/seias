#encoding:utf-8
class OfficeRecord < ActiveRecord::Base
  belongs_to :office
  belongs_to :user
  attr_accessible :info, :office_id, :user_id
end
