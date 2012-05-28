class AddCountryStateToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :state_id, :integer
    add_column :towns, :country_id, :integer
  end
end
