class CreatePriorityProgramStrategies < ActiveRecord::Migration
  def change
    create_table :priority_program_strategies do |t|
      t.string :name
      t.text :description
      t.integer :hierarchy
      t.integer :priority_program_goal_id

      t.timestamps
    end
  end
end
