class CatalogTable < ActiveRecord::Migration

  def change
    create_table :catalog_tables do |t|
      t.string :name, :null => false, :default => true
      t.string :model, :null => false, :default => true
      t.string :table, :null => false, :default => true
      t.timestamps
    end
  end

end
