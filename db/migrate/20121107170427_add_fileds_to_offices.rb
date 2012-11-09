class AddFiledsToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :direction_id, :integer
  end
end
