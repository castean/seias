class RemoveCatalogTableRefereceFromCriticalFacotor < ActiveRecord::Migration
  def up
    remove_column :critical_factors, :catalog_table_reference
  end

  def down
  end
end
