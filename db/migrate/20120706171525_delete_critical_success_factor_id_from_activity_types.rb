class DeleteCriticalSuccessFactorIdFromActivityTypes < ActiveRecord::Migration
  def up
    remove_column :activity_types, :critical_success_factor_id
  end

  def down
  end
end
