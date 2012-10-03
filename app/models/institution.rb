#encoding:utf-8
class Institution < ActiveRecord::Base
  acts_as_gmappable
  belongs_to :county, :primary_key => "cve_mun"
  belongs_to :town
  belongs_to :user
  belongs_to :religion
  has_and_belongs_to_many(:institutions,
                          :join_table => "father_institutions",
                          :foreign_key => "institution_id",
                          :association_foreign_key => "father_institution_id")

  attr_accessible :address, :business_line_id, :county_id, :date_operation_end, :date_operation_start, :email, :external_address_number,
                  :gmaps, :institution_type_id, :internal_address_number, :latitude, :legal_last_name, :legal_name,
                  :legal_second_last_name, :link_user_id, :longitude, :name, :phone, :religion_id, :rfc, :second_address, :status_id, :town_id,
                  :type_person, :zip_code,
                  #Para seleccionar multiples lineas de accion antes de crear un Programa
                  :selectRight, :selectLeft
  attr_accessor :selectRight, :selectLeft

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
