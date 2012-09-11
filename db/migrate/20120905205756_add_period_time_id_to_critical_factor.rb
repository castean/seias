class AddPeriodTimeIdToCriticalFactor < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.integer :period_time_id
    end
  end
end
