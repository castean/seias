class AddCriterionOfMeasurementToCriticalFactors < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.references :criterion_of_measurement
    end
  end
end
