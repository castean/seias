class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.integer :cve_mun
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end
end
