class CriticalSuccessFactor < ActiveRecord::Base
  belongs_to :critical_success_factor_type
  belongs_to :unit_of_measurement
  belongs_to :sexennial_state_plan_component
  belongs_to :user

  attr_accessible :critical_success_factor_type,:title, :description,:percentage, :objective_minimum,
                  :objective_satisfying, :objective_excelent, :unit_of_measurement, :unit_of_measurement_description,
                  :confidential, :sexennial_state_plan_component
end
