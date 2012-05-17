class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :month, :null => false
      t.integer :year, :null => false
      t.string :minimum, :null => false
      t.string :satisfying, :null => false
      t.string :excelent, :null => false
      t.references :critical_success_factor

      t.timestamps
    end
    add_index :goals, :critical_success_factor_id
  end
end
