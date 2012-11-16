class FixWortWorthId < ActiveRecord::Migration
  def up
    rename_column :benefits, :worth, :worth_id
  end

  def down
  end
end
