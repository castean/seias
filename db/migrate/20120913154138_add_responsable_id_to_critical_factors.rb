class AddResponsableIdToCriticalFactors < ActiveRecord::Migration
  def change
    change_table :critical_factors do |t|
      t.integer :responsable_id
    end
  end
end
