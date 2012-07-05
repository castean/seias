class DeletePedProgramIdFromPedAxisDevelopments < ActiveRecord::Migration
  def up
    remove_column :ped_axis_developments, :ped_program_definition_id
  end

  def down
    
  end
end
