class CreateOfficeAllocations < ActiveRecord::Migration
  def change
    create_table :office_allocations do |t|
      t.integer :office_id
      t.text :infot
      t.integer :user_id
      t.string :to
      t.string :place
      t.integer :location_status
      t.integer :move_by_user_id

      t.timestamps
    end
  end
end
