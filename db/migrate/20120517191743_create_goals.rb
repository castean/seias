class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :month
      t.integer :year
      t.string :minimum
      t.string :satisfying
      t.string :excelent
      t.references :critical_success_factor

      t.timestamps
    end
    add_index :goals, :critical_success_factor_id
  end
end
