class CountiesJudicialDistricts < ActiveRecord::Migration
  def change
    create_table :counties_judicial_districts , :id => false do |t|
      t.integer :county_id
      t.integer :judicial_district_id
    end
  end
end
