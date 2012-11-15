class CriterionOfMeasurement < ActiveRecord::Migration

    def change
      create_table :criterion_of_measurements do |t|
        t.string :name, :null => false, :default => true
        t.timestamps
      end
    end

end
