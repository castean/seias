class AddCatalogTableIdToCriticalFactor3 < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.integer :catalog_table_reference
    end
  end
end
