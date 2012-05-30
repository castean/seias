class Addgmaptotowns < ActiveRecord::Migration
  def change
    add_column :towns, :gmaps, :string, :default => true
  end

  def down
  end
end
