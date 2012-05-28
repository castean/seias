class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.integer :cve_loc
      t.string :name
      t.integer :county_id
      t.string :environment
      t.string :latitude
      t.string :length
      t.float :lat_dec
      t.float :leng_dec
      t.integer :altitude
      t.string :cve_carta

      t.timestamps
    end
  end
end
