#encoding:utf-8
class Person < ActiveRecord::Base
  acts_as_gmappable
  #has_many :relations
  #has_many :relatives, :through => "relations"
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "52x52>" }
  belongs_to :town
  belongs_to :ethnic_group
  #belongs_to :sex
  belongs_to :office
  belongs_to :medical_service
  belongs_to :relationship
  belongs_to :grade, :foreign_key => "schooling"
  belongs_to :school_type
  belongs_to :discapacity_origin
  has_and_belongs_to_many :discapacities
  has_and_belongs_to_many :functional_supports
  has_and_belongs_to_many :documentations
  has_many :families
  has_many :kins, :through => :families
  belongs_to :marital_status
  belongs_to :SocioeconomicStudy

  has_many :inverse_families, :class_name => "Family", :foreign_key => "kin_id"
  has_many :inverse_kins, :through => :inverse_families, :source => :person
  has_many :affiliates
  has_many :offices
  attr_accessible :name, :last_name, :second_last_name, :marital_status_id, :sex, :ethnic_group_id, :birthday, :born_town_id, :born_county_id, :county_id, :town_id, :address, :address_two,
                  :code_area, :phone, :cel_phone, :emergency_phone, :rfc, :curp, :email, :tutor, :tutor_relationship_id, :tutor_marital_status_id, :medical_service_id,
                  :student, :reader, :schooling, :school_type_id, :worker, :job, :self_employment, :occupation, :job_seeker, :user_id, :discapacity_status, :diagnosis,
                  :diagnosis_description, :discapacity_origin_id, :discapacity_origin_year, :observations, :status_id, :use_functional_support, :selectLeftD,
                  :selectRightD, :selectLeftFS, :selectRightFS, :avatar, :selectLeftDo, :selectRightDo, :income, :social_security_number,
                  :latitude, :longitude, :gmaps
  attr_accessor   :selectLeftD, :selectRightD, :selectLeftFS, :selectRightFS, :selectLeftDo, :selectRightDo

  validates_uniqueness_of :name , :scope => [:last_name, :second_last_name, :birthday]

  def selectRightD=(options)

    self.discapacities.clear

    options.each do |option|
      unless option.empty?
        line = Discapacity.find(option)
        self.discapacities << line
      end
    end
  end

  def selectRightFS=(options)

    self.functional_supports.clear

    options.each do |option|
      unless option.empty?
        line = FunctionalSupport.find(option)
        self.functional_supports << line
      end
    end
  end

  def selectRightDo=(options)

    self.documentations.clear

    options.each do |option|
      unless option.empty?
        line = Documentation.find(option)
        self.documentations << line
      end
    end
  end
  def fullname
    "#{name} #{last_name} #{second_last_name}"
  end
  def funky_method
    "#{name} #{last_name} #{second_last_name}"
  end
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{address}, #{town.name}, #{town.county.name}"
  end
  def gmaps4rails_infowindow
  "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
  end
end
