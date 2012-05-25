class ChangefieldmeasurementToActivityTypes < ActiveRecord::Migration
  def up
    change_table :activity_types do |t|
      t.integer :measurement_id
    end
  end

  def down
    remove_column :activity_types, :measurement
  end
end
