class AddNameToStaticalMap < ActiveRecord::Migration
  def change
    add_column :statical_maps, :name, :string
  end
end
