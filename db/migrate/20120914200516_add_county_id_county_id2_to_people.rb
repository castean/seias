class AddCountyIdCountyId2ToPeople < ActiveRecord::Migration
  def change
    add_column :people, :county_id, :integer
    add_column :people, :county_id_2, :integer
  end
end
