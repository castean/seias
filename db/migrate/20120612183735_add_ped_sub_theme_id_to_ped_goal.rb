class AddPedSubThemeIdToPedGoal < ActiveRecord::Migration
  def change
    change_table :ped_goals do |t|
      t.integer :ped_sub_theme_id
    end
  end
end
