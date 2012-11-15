class CatalogTablesCriticalFactors < ActiveRecord::Migration
  def change
    create_table :catalog_tables_critical_factors , :id => false do |t|
      t.integer :catalog_table_id
      t.integer :critical_factor_id
      t.integer :table_select_field_id
    end
  end
end
