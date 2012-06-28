#encoding:utf-8
class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  belongs_to :activity_type
  belongs_to :user
  
  attr_accessible :activity_date_start,:activity_date_end, :description, :value, :town_id, :group_id, :public_target_id, :activity_type_id, :county_id, :user_id, :qty_women, :qty_men
  
  validates_numericality_of :qty_men, :only_integer => true
  validates_numericality_of :qty_women, :only_integer => true
  validates :activity_date_start, :presence => true
  validates :activity_date_end, :presence => true
  validates :value, :presence => true
  validates :town_id, :presence => true
  validates :group_id, :presence => true
  validates :public_target_id, :presence => true
  validates :activity_type_id, :presence => true
  validates :county_id, :presence => true
  validate :validate_captured_day
  validate :validate_activity_sdate
  validate :validate_sdate_fdate

  before_save :validar_nulos
  
  def validar_nulos
    if self.qty_men.nil?
      self.qty_men = 0
    end
    if self.qty_women.nil?
      self.qty_women = 0
    end
  end

  def validate_captured_day
    hoy = Date.today
    diahoy = Date.today.day
    if self.activity_date_start.month < hoy.month
      if diahoy > self.activity_type.critical_success_factor.program.cut_day
        errors.add(:activity_date_start, "La fecha límite para captura de esa actividad ya termino")
      end
    end
  end

  def validate_activity_sdate
    limite = Date.today + 7
    if self.activity_date_start > limite
      errors.add(:activity_date_start, "No se pueden capturar actividades con fecha de inicio mayor a 7 dias a partir del día de hoy")
    end
  end

  def validate_sdate_fdate
    if self.activity_date_end < self.activity_date_start
      errors.add(:activity_date_end, "La fecha de termino de la actividad debe ser mayor o igual a la fecha de inicio")
    end
    
  end
end
