class CreatePeriodTimes < ActiveRecord::Migration
  def change
    create_table :period_times do |t|
      t.string :name

      t.timestamps
    end
  end
end
