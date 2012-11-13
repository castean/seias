#encoding:utf-8
class OfficeRecord < ActiveRecord::Base
  belongs_to :office
  belongs_to :user
  attr_accessible :info, :office_id, :user_id

  after_create :update_office_status

  def update_office_status
    office.update_status
  end
end
