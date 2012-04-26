class CreateCriticalSuccessFactorTypes < ActiveRecord::Migration
  def change
    create_table :critical_success_factor_types do |t|
      t.string  :name

      t.timestamps
    end
  end
end
