#encoding:utf-8
class Institution < ActiveRecord::Base
  acts_as_gmappable
  belongs_to :county, :primary_key => "cve_mun"
  belongs_to :town
  belongs_to :user
  belongs_to :religion

  has_many :affiliates

  belongs_to :business_line
  belongs_to :type_person, :foreign_key => "type_person"
  has_many :one_reg_institutions
  has_many :school_ages
  has_many :age_populations
  has_many :age_ranges
  has_many :grades
  has_many :sex
  has_many :guardianships
  has_and_belongs_to_many :discapacities

  has_and_belongs_to_many(:institutions,
                          :join_table => "father_institutions",
                          :foreign_key => "institution_id",
                          :association_foreign_key => "father_institution_id")

  attr_accessible :address, :business_line_id, :county_id, :date_operation_end, :date_operation_start, :email, :external_address_number,
                  :gmaps, :institution_type_id, :internal_address_number, :latitude, :legal_last_name, :legal_name,
                  :legal_second_last_name, :link_user_id, :longitude, :name, :phone, :religion_id, :rfc, :second_address, :status_id, :town_id,
                  :type_person, :zip_code,
                  #Para seleccionar multiples Instituciones de apoyo antes de crear una Institución
                  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft

  validates :name, :presence => true
  validates :rfc, :presence => true
  validates :address, :presence => true
  validates :external_address_number, :presence => true
  validates :second_address, :presence => true
  validates :zip_code, :presence => true
  validates :email, :presence => true
  validates :legal_name, :presence => true
  validates :legal_last_name, :presence => true
  validates :link_user_id, :presence => true
  validates :date_operation_start, :presence => true

  validate :valida_town_id
  def valida_town_id
    t = self.town_id
    if t == 0 or t.blank? or t.nil?
      errors.add('Localidad: ', "Seleccione por favor una Localidad")
    end
  end

  validate :valida_giro
  def valida_giro
    t = self.business_line_id
    if t == 0 or t.blank? or t.nil?
      errors.add('Giro de la Institución: ', "Seleccione por favor un giro")
    end
  end

  def selectRight=(options)

    self.institutions.clear

    options.each do |option|
      unless option.empty?
        line = Institution.find(option)
        self.institutions << line
      end
    end
  end

  def gmaps4rails_address
     #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.external_address_number}, #{self.town_id}"
  end
end
