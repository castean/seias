class CreatePedProgramDefinitions < ActiveRecord::Migration
  def change
    create_table :ped_program_definitions do |t|
      t.string :name
      t.text :description
      t.integer :ped_id

      t.timestamps
    end
  end
end
