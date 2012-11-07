#encoding:utf-8
class Office < ActiveRecord::Base
  belongs_to :department
  belongs_to :direction
  belongs_to :person
  belongs_to :activity_type
  attr_accessible :activity_type_id, :avatar, :department_id, :external_office_number, :internal_office_number, :name, :observations, :office_date,
                  :office_recive_date, :person_id, :priority_id, :record_no, :status_id, :to, :type_id, :user_id
  attr_accessor :program_id, :activity_type_id, :person_id
end
