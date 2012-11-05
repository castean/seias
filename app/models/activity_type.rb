#encoding:utf-8
class ActivityType < ActiveRecord::Base
  scoped_search :on => :name, :complete_value => :true, :default_order => true
  belongs_to :unit_of_measurement
  has_many :activities, :order => 'activity_date_start DESC'
  has_and_belongs_to_many :critical_success_factors
  has_many :affiliates

  attr_accessible :description, :unit_of_measurement_id, :measurement_description, :name, :priority, :user_id,
  #Para seleccionar multiples FCE / Indicadores antes de crear una Acción
  :selectRightActivity, :selectLeft
  attr_accessor :selectRightActivity, :selectLeft
  
  validates :name, :presence => true  
  validates :unit_of_measurement_id, :presence => true

  before_destroy :check_for_activities

  def check_for_activities
    if activities.count > 0
      errors.add_to_base("No se pueden borrar acciones mientras tenga actividades dependientes")
      return false
    end
  end

  def selectRightActivity=(options)
    self.critical_success_factors.clear
    options.each do |option|
      unless option.empty?
        line = CriticalSuccessFactor.find(option)
        self.critical_success_factors << line
      end
    end
  end

end