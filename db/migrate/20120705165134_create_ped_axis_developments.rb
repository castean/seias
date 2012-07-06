class CreatePedAxisDevelopments < ActiveRecord::Migration
  def change
    create_table :ped_axis_developments do |t|
      t.string :name
      t.text :description
      t.integer :ped_program_definition_id

      t.timestamps
    end
  end
end
