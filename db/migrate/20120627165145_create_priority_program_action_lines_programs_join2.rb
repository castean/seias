class CreatePriorityProgramActionLinesProgramsJoin2 < ActiveRecord::Migration
  def change
    create_table :priority_program_action_lines_programs , :id => false do |t|
      t.integer :priority_program_action_line_id
      t.integer :program_id
      
      t.timestamps
    end  
  end
end
