class AddCountiesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :county_id, :integer
  end
end
