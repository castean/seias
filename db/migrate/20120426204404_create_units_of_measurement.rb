class CreateUnitsOfMeasurement < ActiveRecord::Migration
  def change
    create_table :units_of_measurement do |t|
      t.string :name

      t.timestamps
    end
  end
end
