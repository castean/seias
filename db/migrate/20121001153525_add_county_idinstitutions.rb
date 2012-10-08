class AddCountyIdinstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :county_id, :integer
  end
end
