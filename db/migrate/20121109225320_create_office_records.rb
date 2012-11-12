class CreateOfficeRecords < ActiveRecord::Migration
  def change
    create_table :office_records do |t|
      t.integer :office_id
      t.text :info
      t.integer :user_id

      t.timestamps
    end
  end
end
