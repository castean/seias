#encoding:utf-8
class ActivityType < ActiveRecord::Base
  
  belongs_to :unit_of_measurement
  belongs_to :critical_success_factor
  has_many :activities
  
  attr_accessible :description, :unit_of_measurement_id, :measurement_description, :name, :critical_success_factor_id, :priority, :user_id
  
  validates :name, :presence => true
  validates :unit_of_measurement_id, :presence => true
  validates :critical_success_factor_id, :presence => true
  
  before_destroy :check_for_activities
  
  def check_for_activities
    if activities.count > 0
      errors.add_to_base("No se pueden borrar acciones mientras tenga actividades dependientes")
      return false
    end
  end
  
  
  
end