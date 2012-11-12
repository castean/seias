class AddIncomeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :income, :float
  end
end
