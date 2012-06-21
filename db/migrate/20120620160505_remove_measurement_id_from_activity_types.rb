class RemoveMeasurementIdFromActivityTypes < ActiveRecord::Migration
  def up
    remove_column :activity_types, :measurement_id
      end

  def down
    add_column :activity_types, :measurement_id, :integer
  end
end
