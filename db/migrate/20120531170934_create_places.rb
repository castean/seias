class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :place_type
      t.string :name
      t.string :address
      t.integer :town_id
      t.text :info
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
