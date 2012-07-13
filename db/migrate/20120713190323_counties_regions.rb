class CountiesRegions < ActiveRecord::Migration
  def change
    create_table :counties_regions , :id => false do |t|
      t.integer :county_id
      t.integer :region_id
    end
  end
end
