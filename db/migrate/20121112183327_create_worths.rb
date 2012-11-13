class CreateWorths < ActiveRecord::Migration
  def change
    create_table :worths do |t|
      t.string :name
      t.integer :direction_id

      t.timestamps
    end
  end
end
