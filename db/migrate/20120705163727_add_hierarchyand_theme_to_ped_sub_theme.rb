class AddHierarchyandThemeToPedSubTheme < ActiveRecord::Migration
  def change
      change_table :ped_sub_themes do |t|
      t.integer :ped_theme_id
      t.integer :hierarchy
    end
  end
end
