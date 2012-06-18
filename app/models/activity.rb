class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  belongs_to :activity_type
  belongs_to :user
  validates_numericality_of :qty_men, :only_integer => true
  validates_numericality_of :qty_women, :only_integer => true
  attr_accessible :activity_date_start,:activity_date_end, :description, :value, :town_id, :group_id, :public_target_id, :activity_type_id, :county_id, :user_id, :qty_women, :qty_men
  validates :activity_date_start, :presence => true
  validates :activity_date_end, :presence => true
  validates :value, :presence => true
  validates :town_id, :presence => true
  validates :group_id, :presence => true
  validates :public_target_id, :presence => true
  validates :activity_type_id, :presence => true
  validates :county_id, :presence => true


  before_save :validar_nulos
  
  def validar_nulos
    if self.qty_men.nil?
      self.qty_men = 0
    end
    if self.qty_women.nil?
      self.qty_women = 0
    end
  end



end
