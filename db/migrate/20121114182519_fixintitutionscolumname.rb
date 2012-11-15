class Fixintitutionscolumname < ActiveRecord::Migration
  def self.up
    rename_column :institutions, :institution_type_id, :institutions_type_id
  end
  def self.down
    # rename back if you need or do something else or do nothing
  end
end

