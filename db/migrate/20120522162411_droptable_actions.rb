class DroptableActions < ActiveRecord::Migration
  def change
    drop_table :actions
    drop_table :type_activities
  end


end
