class DeleteUnitOfMeasurementDescriptionOnCriticalFactor < ActiveRecord::Migration
  def up
    remove_column :critical_factors, :unit_of_measurement_description
  end

  def down
  end
end
