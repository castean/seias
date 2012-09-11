class AddCriticalFactorIdToCriticalFactor < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.integer :critical_factor_id
    end
  end
end
