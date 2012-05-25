class AddDirectionIdToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :direction_id, :integer
  end
end
