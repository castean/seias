class PedAxisDevelopmentsPedProgramDefinitions < ActiveRecord::Migration
  def change
    create_table :ped_axis_developments_ped_program_definitions , :id => false do |t|
      t.integer :ped_axis_development_id
      t.integer :ped_programs_definition_id
    end
  end
end
