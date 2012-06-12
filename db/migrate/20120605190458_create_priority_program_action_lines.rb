class CreatePriorityProgramActionLines < ActiveRecord::Migration
  def change
    create_table :priority_program_action_lines do |t|
      t.string :name
      t.text :description
      t.integer :hierarchy
      t.integer :priority_program_strategy_id
      t.integer :ped_action_line_id

      t.timestamps
    end
  end
end
