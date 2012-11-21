class AddGmapsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :latitude,  :float #you can change the name, see wiki
    add_column :people, :longitude, :float #you can change the name, see wiki
    add_column :people, :gmaps, :boolean #not mandatory, see wiki
  end
end
