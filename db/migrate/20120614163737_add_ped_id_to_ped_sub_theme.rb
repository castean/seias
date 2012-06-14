class AddPedIdToPedSubTheme < ActiveRecord::Migration
  def change
    change_table :ped_sub_themes do |t|
      t.integer :ped_id
    end
  end
end
