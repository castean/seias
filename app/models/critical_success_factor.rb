class CriticalSuccessFactor < ActiveRecord::Base
  belongs_to :critical_success_factor_type
  belongs_to :unit_of_measurement
  belongs_to :sexennial_state_plan_component
  belongs_to :user
  belongs_to :program

  attr_accessible :title, :description,:percentage, :objective_minimum,
                  :objective_satisfying, :objective_excelent, :critical_success_factor_type_id, :unit_of_measurement_id,
                  :unit_of_measurement_description, :confidential, :sexennial_state_plan_component_id, :program_id
end
