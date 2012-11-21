#encoding:utf-8
class Office < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "52x52>" }, :default_url => ActionController::Base.helpers.asset_path("avatar.png")
  belongs_to :department
  belongs_to :direction
  belongs_to :person
  belongs_to :user
  belongs_to :institution
  belongs_to :status
  belongs_to :activity_type
  belongs_to :office
  has_many :office_records
  has_many :office_allocations
  attr_accessible :activity_type_id, :avatar, :department_id, :external_office_number, :internal_office_number, :name, :observations, :office_date,
                  :office_recive_date, :person_id, :priority_id, :record_no, :status_id, :to, :type_id, :user_id, :direction_id, :program_id, :person, :institution_id
  attr_accessor :program_id, :person

  #validates :person_id, :presence => true

  #validates :activity_type_id, :presence => true


  before_save :get_user_id
  after_create :update_internal_office_number

  def get_user_id
    self.user_id = self.department.user_id
  end

  def update_internal_office_number
    update_attribute :internal_office_number, "#{id}"
  end

  def update_status
    update_attribute :status_id, 3
  end
end
