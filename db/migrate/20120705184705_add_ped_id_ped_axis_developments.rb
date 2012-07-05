class AddPedIdPedAxisDevelopments < ActiveRecord::Migration
  def change
      change_table :ped_axis_developments do |t|
      t.integer :ped_id
    end
  end
end
