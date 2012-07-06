class CreatePedThemes < ActiveRecord::Migration
  def change
    create_table :ped_themes do |t|
      t.string :name
      t.text :description
      t.integer :ped_axis_development_id

      t.timestamps
    end
  end
end
