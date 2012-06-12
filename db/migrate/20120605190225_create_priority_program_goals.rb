class CreatePriorityProgramGoals < ActiveRecord::Migration
  def change
    create_table :priority_program_goals do |t|
      t.string :name
      t.text :description
      t.integer :hirarchy
      t.integer :priority_program_id

      t.timestamps
    end
  end
end
