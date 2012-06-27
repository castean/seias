class AddNameToStaticalMap < ActiveRecord::Migration
  def change
    add_column :statistical_maps, :name, :string
  end
end
