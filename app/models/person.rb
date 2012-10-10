#encoding:utf-8
class Person < ActiveRecord::Base
  belongs_to :town
  belongs_to :ethnic_group
  belongs_to :sex
  belongs_to :medical_service

  attr_accessible :name, :last_name, :second_last_name, :marital_status_id, :sex, :ethnic_group_id, :birthday, :born_town_id, :county_id, :county_id_2, :town_id, :address, :address_two,
                  :code_area, :phone, :cel_phone, :emergency_phone, :rfc, :curp, :email, :tutor, :tutor_relationship_id, :tutor_marital_status_id, :medical_service_id,
                  :student, :reader, :schooling, :school_type_id, :worker, :job, :self_employment, :occupation, :job_seeker, :user_id, :discapacity_status, :diagnosis,
                  :diagnosis_description, :discapacity_origin_id, :discapacity_origin_year, :observations, :status_id, :funcional_support
  attr_accessor   :county_id, :county_id_2
end
