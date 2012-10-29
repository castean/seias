class CreateTableFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :person_id
      t.integer :kin_id
      t.integer :relationship_id

      t.timestamps
    end
  end
end
