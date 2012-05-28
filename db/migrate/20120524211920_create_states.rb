class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :cve_ent
      t.string :name
      t.integer :country_id

      t.timestamps
    end
  end
end
