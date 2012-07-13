class CreateActivityTypeCriticalSuccessFactors < ActiveRecord::Migration
  def change
    create_table :activity_types_critical_success_factors , :id => false do |t|
      t.integer :activity_type_id
      t.integer :critical_success_factor_id
    end
  end
end
