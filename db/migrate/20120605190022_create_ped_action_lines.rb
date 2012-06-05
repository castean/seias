class CreatePedActionLines < ActiveRecord::Migration
  def change
    create_table :ped_action_lines do |t|
      t.string :name
      t.text :description
      t.integer :hirarchy
      t.integer :ped_strategy_id

      t.timestamps
    end
  end
end
