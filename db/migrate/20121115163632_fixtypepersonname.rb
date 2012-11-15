class Fixtypepersonname < ActiveRecord::Migration
  def self.up
    rename_column :institutions, :type_person, :type_person_id
  end
  def self.down
    # rename back if you need or do something else or do nothing
  end
end
