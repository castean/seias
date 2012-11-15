class SocioeconomicStudy < ActiveRecord::Base
  belongs_to :condition
  belongs_to :people_by_room
  belongs_to :number_of_room
  belongs_to :housing_feature
  belongs_to :relationship
  attr_accessible :air_conditioning, :children_education, :condition_id, :construction_material_floor, :construction_material_roof, :construction_material_wall, :description_evaluation_general, :dvd, :environment, :family_dinamyc, :family_history, :fridge, :health, :heritage_assets, :housing_feature_id, :labor_company, :labor_time, :labor_work_seniority, :microweave, :neighbor_references, :number_of_room_id, :people_by_room_id, :person_id, :phone, :relationship_id, :service_drainage, :service_electricity, :service_gas, :service_paving, :service_phone, :service_transportation, :service_water, :spending_auto, :spending_education, :spending_food, :spending_monthly_payment, :spending_other, :spending_payment, :spending_rent, :stove, :study_person_name, :study_place, :total_point
end
