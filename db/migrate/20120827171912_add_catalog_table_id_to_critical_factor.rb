class AddCatalogTableIdToCriticalFactor < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.references :catalog_table
    end
  end
end
