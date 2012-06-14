class AddPriorityProgramActinLineIdToPrograms < ActiveRecord::Migration
  def change
    change_table :programs do |t|
      t.integer :priority_program_action_line_id
    end
  end
end
