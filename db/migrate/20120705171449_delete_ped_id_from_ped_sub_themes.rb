class DeletePedIdFromPedSubThemes < ActiveRecord::Migration
  def up
    remove_column :ped_sub_themes, :ped_id
  end

  def down
  end
end
