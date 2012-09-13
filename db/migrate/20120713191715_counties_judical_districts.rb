class CountiesJudicalDistricts < ActiveRecord::Migration
  def change
    create_table :counties_judicial_districts , :id => false do |t|
      t.integer :county_id
      t.integer :judical_district_id
    end
  end
end
