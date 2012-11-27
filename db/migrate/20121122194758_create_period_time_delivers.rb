class CreatePeriodTimeDelivers < ActiveRecord::Migration
  def change
    create_table :period_time_delivers do |t|
      t.integer :period_time_id
      t.integer :period_number
      t.integer :affiliate_id
      t.string :benefit_id
      t.boolean :delivered

      t.timestamps
    end
  end
end
