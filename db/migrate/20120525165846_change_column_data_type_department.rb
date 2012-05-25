class ChangeColumnDataTypeDepartment < ActiveRecord::Migration
  def up
    add_column :departments, :direction_id, :integer

  end

  def down
    

  end
end
