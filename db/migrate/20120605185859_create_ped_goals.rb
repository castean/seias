class CreatePedGoals < ActiveRecord::Migration
  def change
    create_table :ped_goals do |t|
      t.string :name
      t.text :description
      t.integer :hirarchy
      t.integer :ped_id

      t.timestamps
    end
  end
end
