class AddUnitOfMeasurementToActivityTypes < ActiveRecord::Migration
  def change
    add_column :activity_types, :unit_of_measurement_id, :integer
  end
end
