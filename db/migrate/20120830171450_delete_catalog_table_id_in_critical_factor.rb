class DeleteCatalogTableIdInCriticalFactor < ActiveRecord::Migration
  def up
    remove_column :critical_factors, :catalog_table_id
  end

  def down
  end
end
