class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.integer :person_id
      t.integer :institution_id
      t.integer :activity_type_id
      t.integer :period_time_id
      t.integer :period_number
      t.integer :institution_id

      t.timestamps
    end
  end
end
