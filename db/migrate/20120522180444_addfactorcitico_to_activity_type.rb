class AddfactorciticoToActivityType < ActiveRecord::Migration
  def up
      change_table :activity_types do |t|
        t.integer :critical_success_factor_id
    end
  end
end
