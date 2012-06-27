class RemovePriorityProgramActionLineIdToPrograms < ActiveRecord::Migration
  def up
    remove_column :programs, :priority_program_action_line_id
  end

  def down
  end
end
