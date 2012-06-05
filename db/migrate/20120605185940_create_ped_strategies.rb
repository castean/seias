class CreatePedStrategies < ActiveRecord::Migration
  def change
    create_table :ped_strategies do |t|
      t.string :name
      t.text :description
      t.integer :hirarchy
      t.integer :ped_goal_id

      t.timestamps
    end
  end
end
