class Activity < ActiveRecord::Base
  belongs_to :town
  belongs_to :group
  belongs_to :public_target
  belongs_to :activity_type
  belongs_to :user
  attr_accessible :activity_date_start,:activity_date_end, :description, :value, :town_id, :group_id, :public_target_id, :activity_type_id, :county_id, :user_id, :qty_women, :qty_men

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
