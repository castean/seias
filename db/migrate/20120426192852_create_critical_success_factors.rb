class CreateCriticalSuccessFactors < ActiveRecord::Migration
  def change
    create_table :critical_success_factors do |t|
      t.references :critical_success_factor_type
      t.references :user
      t.string  :title, :null => :false, :length => 300
      t.text    :description, :null => false
      t.decimal :percentage, :precision => 10,:scale => 5
      t.string :objective_minimum
      t.string :objective_satisfying
      t.string :objective_excelent
      t.references :unit_of_measurement, :null => false
      t.string    :unit_of_measurement_description, :null => false
      t.boolean :confidential, :null => false
      t.boolean :active, :null => false, :default => true
      t.references :sexennial_state_plan_component #PES

      t.timestamps
    end
  end
end
