class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :description
      t.integer :initial_value
      t.integer :final_value

      t.timestamps
    end
  end
end
