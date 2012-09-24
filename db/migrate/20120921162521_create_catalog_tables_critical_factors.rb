class CreateCatalogTablesCriticalFactors < ActiveRecord::Migration
  def change
    create_table :catalog_tables_critical_factors do |t|

      t.timestamps
    end
  end
end
