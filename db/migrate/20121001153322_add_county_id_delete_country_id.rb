class AddCountyIdDeleteCountryId < ActiveRecord::Migration
  def up
    remove_column :institutions, :country_id
  end

  def down
    add_column :institutions, :county_id, :integer
  end
end
