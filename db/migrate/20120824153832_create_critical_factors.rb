class CreateCriticalFactors < ActiveRecord::Migration
  def change
    create_table :critical_factors do |t|
      t.references :critical_success_factor_type
      t.references :user
      t.string  :name, :null => :false, :length => 300
      t.text    :description, :null => false
      t.decimal :percentage, :precision => 10,:scale => 5
      t.float :objective_minimum
      t.float :objective_satisfying
      t.float :objective_excelent
      t.references :unit_of_measurement, :null => false
      t.string    :unit_of_measurement_description, :null => false
      t.boolean :confidential, :null => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
